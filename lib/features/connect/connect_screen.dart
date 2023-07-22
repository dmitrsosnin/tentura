import 'package:gravity/app/router.dart';

import 'package:gravity/data/gql/beacon/_g/beacon_search_by_id.req.gql.dart';

import 'package:gravity/ui/ferry.dart';
import 'package:gravity/ui/widget/avatar_image.dart';
import 'package:gravity/ui/widget/rating_button.dart';
import 'package:gravity/ui/widget/error_center_text.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({super.key});

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.qr_code),
              onPressed: () {},
            ),
          ],
          leading: const RatingButton(),
          leadingWidth: RatingButton.width,
        ),
        body: Column(
          children: [
            // Search control
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Type a Code (at least 3 symbols)',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {});
                    },
                  ),
                ),
                onSubmitted: (value) {
                  if (value.length > 2) setState(() {});
                },
              ),
            ),
            if (_searchController.text.length > 2)
              Operation(
                client: GetIt.I<Client>(),
                operationRequest: GBeaconSearchByIdReq(
                  (b) => b..vars.startsWith = '${_searchController.text}%',
                ),
                builder: (context, response, error) {
                  if (response?.loading ?? false) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  } else if (response?.data == null) {
                    return ErrorCenterText(response: response, error: error);
                  }
                  final beacons = response!.data!.beacon;
                  return ListView.separated(
                    shrinkWrap: true,
                    itemCount: beacons.length,
                    itemBuilder: (context, i) => ListTile(
                      leading: AvatarImage(
                        size: 40,
                        userId: beacons[i].author.has_picture
                            ? beacons[i].author.id
                            : '',
                      ),
                      title: Text(beacons[i].title),
                      subtitle: Text(
                        beacons[i].description,
                        maxLines: 1,
                      ),
                      onTap: () => context.push(
                        Uri(
                          path: pathBeaconDetails,
                          queryParameters: {'id': beacons[i].id},
                        ).toString(),
                        extra: beacons[i],
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
              ),
          ],
        ),
      );
}
