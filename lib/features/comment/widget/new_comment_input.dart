import 'package:gravity/data/gql/comment/_g/comment_create.req.gql.dart';

import 'package:gravity/ui/utils/ferry_utils.dart';

class NewCommentInput extends StatefulWidget {
  final String beaconId;
  final OperationRequest<Object, Object> refreshRequest;

  const NewCommentInput({
    required this.beaconId,
    required this.refreshRequest,
    super.key,
  });

  @override
  State<NewCommentInput> createState() => _NewCommentInputState();
}

class _NewCommentInputState extends State<NewCommentInput> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  hintText: 'Write a comment',
                ),
                maxLines: null,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () async {
                final response = await doRequest(
                  context: context,
                  request: GCommentCreateReq(
                    (b) => b
                      ..vars.beacon_id = widget.beaconId
                      ..vars.content = _textController.text,
                  ),
                );
                if (context.mounted && response.hasNoErrors) {
                  _textController.clear();
                  FocusScope.of(context).unfocus();
                  GetIt.I<Client>()
                      .requestController
                      .add(widget.refreshRequest);
                }
              },
            ),
          ],
        ),
      );
}
