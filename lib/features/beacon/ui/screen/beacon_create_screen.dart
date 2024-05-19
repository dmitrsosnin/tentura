import 'dart:io';
import 'dart:typed_data';

import 'package:tentura/consts.dart';
import 'package:tentura/ui/routes.dart';
import 'package:tentura/ui/utils/ui_consts.dart';
import 'package:tentura/ui/utils/ui_utils.dart';
import 'package:tentura/ui/utils/ferry_utils.dart';
import 'package:tentura/ui/dialog/choose_location_dialog.dart';
import 'package:tentura/domain/entity/lat_long.dart';

import '../bloc/beacon_cubit.dart';

class BeaconCreateScreen extends StatefulWidget {
  static GoRoute getRoute({
    GlobalKey<NavigatorState>? parentNavigatorKey,
  }) =>
      GoRoute(
        path: pathBeaconCreate,
        parentNavigatorKey: parentNavigatorKey,
        builder: (context, state) => const BeaconCreateScreen(),
      );

  const BeaconCreateScreen({super.key});

  @override
  State<BeaconCreateScreen> createState() => _BeaconCreateScreenState();
}

class _BeaconCreateScreenState extends State<BeaconCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _imageController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateRangeController = TextEditingController();
  final _descriptionController = TextEditingController();

  late final _beaconCubit = context.read<BeaconCubit>();

  DateTimeRange? _dateRange;
  LatLng? _coordinates;
  Uint8List? _image;

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    _locationController.dispose();
    _dateRangeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            // Publish Button
            TextButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  try {
                    await _beaconCubit.create(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      dateRange: _dateRange,
                      coordinates: _coordinates,
                      image: _image,
                    );
                    if (context.mounted) context.pop();
                  } catch (e) {
                    if (context.mounted) {
                      showSnackBar(
                        context,
                        isError: true,
                        text: e.toString(),
                      );
                    }
                  }
                } else {
                  showSnackBar(
                    context,
                    isError: true,
                    text: 'Please check input data!',
                  );
                }
              },
              child: const Text('Publish'),
            ),
            const SizedBox(width: 16),
          ],
        ),

        // Input Form
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Title
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Beacon title',
                ),
                keyboardType: TextInputType.text,
                maxLength: titleMaxLength,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                validator: (value) {
                  if (value == null || value.length < titleMinLength) {
                    return 'Title too short';
                  }
                  return null;
                },
              ),

              // Description
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Description',
                ),
                keyboardType: TextInputType.multiline,
                maxLength: descriptionLength,
                maxLines: null,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),

              // Location
              const SizedBox(height: 20),
              TextFormField(
                readOnly: true,
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Add location',
                  suffixIcon: _locationController.text.isEmpty
                      ? const Icon(Icons.add_location_rounded)
                      : IconButton(
                          onPressed: () {
                            _coordinates = null;
                            _locationController.clear();
                          },
                          icon: const Icon(Icons.cancel_rounded),
                        ),
                ),
                onTap: () async {
                  final place = await ChooseLocationDialog.show(
                    context,
                    center: _coordinates,
                  );
                  if (place != null) {
                    _coordinates = place.point;
                    _locationController.text = place.country == null
                        ? _coordinates.toString()
                        : '${place.locality ?? "Unknown"}, ${place.country}';
                  }
                },
              ),
              // const SizedBox(height: 20),
              const Padding(padding: paddingV8),

              // Time
              TextFormField(
                readOnly: true,
                controller: _dateRangeController,
                decoration: InputDecoration(
                  hintText: 'Set time',
                  suffixIcon: _dateRangeController.text.isEmpty
                      ? const Icon(Icons.date_range_rounded)
                      : IconButton(
                          onPressed: () {
                            _dateRange = null;
                            _dateRangeController.clear();
                          },
                          icon: const Icon(Icons.cancel_rounded),
                        ),
                ),
                onTap: () async {
                  final now = DateTime.timestamp();
                  final dateRange = await showDateRangePicker(
                    context: context,
                    firstDate: now,
                    lastDate: now.add(const Duration(days: 365)),
                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                  );
                  if (dateRange != null) {
                    _dateRange = dateRange;
                    _dateRangeController.text =
                        '${fYMD(_dateRange!.start)} - ${fYMD(_dateRange!.end)}';
                  }
                },
              ),
              const Padding(padding: paddingV8),

              // Image Input
              TextFormField(
                readOnly: true,
                controller: _imageController,
                decoration: InputDecoration(
                  hintText: 'Attach image',
                  suffixIcon: _image == null
                      ? const Icon(Icons.add_a_photo_rounded)
                      : IconButton(
                          onPressed: () {
                            _imageController.clear();
                            setState(() => _image = null);
                          },
                          icon: const Icon(Icons.cancel_rounded),
                        ),
                ),
                onTap: () async {
                  final newImage = await _beaconCubit.pickImage();
                  if (newImage != null) {
                    _imageController.text = newImage.name;
                    _image = await File(newImage.path).readAsBytes();
                    setState(() {});
                  }
                },
              ),

              // Image Container
              Container(
                decoration: BoxDecoration(
                  border:
                      _image == null ? Border.all(color: Colors.black12) : null,
                ),
                margin: const EdgeInsets.symmetric(vertical: 48),
                child: _image == null
                    ? const Icon(
                        Icons.photo_outlined,
                        size: 200,
                      )
                    : Image.memory(
                        _image!,
                        key: ObjectKey(_image),
                        fit: BoxFit.fitWidth,
                      ),
              ),
            ],
          ),
        ),
      );
}
