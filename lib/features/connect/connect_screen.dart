import 'package:gravity/data/auth_repository.dart';
import 'package:gravity/data/gql/beacon/_g/beacon_fetch_by_id.req.gql.dart';

import 'package:gravity/ui/consts.dart';
import 'package:gravity/ui/ferry_utils.dart';
import 'package:gravity/ui/widget/error_center_text.dart';
import 'package:gravity/features/beacon/widget/beacon_tile.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  static const _beaconIdLength = 12;

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: paddingAll20,
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Scan Code Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: FilledButton(
                  child: const Text('Scan QR'),
                  onPressed: () {},
                ),
              ),
              // Search control
              Padding(
                padding: const EdgeInsets.all(40),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Input a Code',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _searchController.clear();
                        setState(() {});
                      },
                    ),
                  ),
                  maxLength: _beaconIdLength,
                  onSubmitted: (value) {
                    if (value.length == _beaconIdLength) setState(() {});
                  },
                ),
              ),
              if (_searchController.text.length == _beaconIdLength)
                Operation(
                  client: GetIt.I<Client>(),
                  operationRequest: GBeaconFetchByIdReq(
                    (b) => b..vars.id = _searchController.text,
                  ),
                  builder: (context, response, error) {
                    if (response?.loading ?? false) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else if (response?.data == null) {
                      return ErrorCenterText(response: response, error: error);
                    } else if (response?.data?.beacon_by_pk == null) {
                      return Text(
                        'No result',
                        style: Theme.of(context).textTheme.bodyLarge,
                      );
                    }
                    final beacon = response!.data!.beacon_by_pk!;
                    return BeaconTile(
                      beacon: beacon,
                      isMine:
                          beacon.author.id == GetIt.I<AuthRepository>().myId,
                    );
                  },
                ),
            ],
          ),
        ),
      );
}
