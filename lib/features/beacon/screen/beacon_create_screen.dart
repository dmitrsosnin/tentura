import 'dart:io';
import 'package:latlong2/latlong.dart';

import 'package:gravity/consts.dart';
import 'package:gravity/app/router.dart';
import 'package:gravity/data/image_repository.dart';
import 'package:gravity/data/geolocation_repository.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_create.req.gql.dart';
import 'package:gravity/ui/dialog/choose_location_dialog.dart';
import 'package:gravity/ui/dialog/error_dialog.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/utils.dart';

class BeaconCreateScreen extends StatefulWidget {
  const BeaconCreateScreen({super.key});

  @override
  State<BeaconCreateScreen> createState() => _BeaconCreateScreenState();
}

class _BeaconCreateScreenState extends State<BeaconCreateScreen> {
  final _titleController = TextEditingController();
  final _imageController = TextEditingController();
  final _locationController = TextEditingController();
  final _dateRangeController = TextEditingController();
  final _descriptionController = TextEditingController();

  var _imagePath = '';
  LatLng? _coordinates;
  DateTimeRange? _dateRange;

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
            TextButton(
              onPressed: _publish,
              child: const Text('Publish'),
            ),
            const SizedBox(width: 16),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Title
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                hintText: 'Beacon title',
              ),
              keyboardType: TextInputType.text,
              maxLength: titleMaxLength,
            ),
            // Description
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              maxLength: descriptionLength,
              maxLines: null,
            ),
            // Image
            TextField(
              controller: _imageController,
              decoration: InputDecoration(
                hintText: 'Attach image',
                suffixIcon: _imagePath.isEmpty
                    ? const Icon(Icons.add_a_photo_rounded)
                    : IconButton(
                        onPressed: () {
                          _imageController.clear();
                          setState(() => _imagePath = '');
                        },
                        icon: const Icon(Icons.cancel_rounded),
                      ),
              ),
              readOnly: true,
              onTap: () async {
                final newImage = await GetIt.I<ImageRepository>().pickImage();
                if (newImage != null) {
                  _imageController.text = newImage.name;
                  setState(() => _imagePath = newImage.path);
                }
              },
            ),
            // Location
            const SizedBox(height: 20),
            TextField(
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
              readOnly: true,
              onTap: _onChooseLocation,
            ),
            const SizedBox(height: 20),
            // Time
            TextField(
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
              readOnly: true,
              onTap: _onChooseDateRange,
            ),
            // Image
            Container(
              decoration: BoxDecoration(
                border: _imagePath.isEmpty
                    ? Border.all(color: Colors.black12)
                    : null,
              ),
              margin: const EdgeInsets.symmetric(vertical: 48),
              child: _imagePath.isEmpty
                  ? const Icon(Icons.photo_outlined, size: 200)
                  : Image.file(File(_imagePath), fit: BoxFit.fitWidth),
            ),
          ],
        ),
      );

  Future<void> _onChooseLocation() async {
    final point = await showDialog<LatLng>(
      context: context,
      builder: (_) => ChooseLocationDialog(center: _coordinates),
    );
    if (point == null) return;
    _coordinates = point;
    _locationController.text = point.toString();
    final place =
        await GetIt.I<GeolocationRepository>().getPlaceNameByCoords(point);
    if (place != null) {
      _locationController.text =
          '${place.locality ?? "Unknown"}, ${place.country ?? "Unknown"}';
    }
  }

  Future<void> _onChooseDateRange() async {
    final now = DateTime.timestamp();
    _dateRange = await showDateRangePicker(
          context: context,
          firstDate: now,
          lastDate: now.add(const Duration(days: 365)),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
        ) ??
        _dateRange;
    if (_dateRange != null) {
      _dateRangeController.text =
          '${fYMD(_dateRange!.start)} - ${fYMD(_dateRange!.end)}';
    }
  }

  Future<void> _publish() async {
    if (_titleController.text.length < titleMinLength) {
      return showDialog<void>(
        context: context,
        builder: (context) => const ErrorDialog(error: 'Title too short'),
      );
    }
    final response = await doRequest(
      context: context,
      request: GBeaconCreateReq(
        (b) => b.vars
          ..title = _titleController.text
          ..description = _descriptionController.text
          ..timerange = _dateRange
          ..place = _coordinates
          ..has_picture = _imageController.text.isNotEmpty,
      ),
    );
    final beacon = response.data?.insert_beacon_one;
    if (beacon != null && _imagePath.isNotEmpty) {
      await GetIt.I<ImageRepository>()
          .putBeacon(
            userId: beacon.author.id,
            beaconId: beacon.id,
            image: await File(_imagePath).readAsBytes(),
          )
          .firstWhere((e) => e.isFinished);
    }
    if (mounted) {
      beacon == null
          ? showDialog<void>(
              context: context,
              builder: (context) => ErrorDialog(
                error: response.linkException ??
                    response.graphqlErrors ??
                    'Something went wrong',
              ),
            )
          : context.pop(beacon);
    }
  }
}
