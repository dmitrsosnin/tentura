import 'package:gravity/ui/ferry_utils.dart';

import 'widget/feed_tab.dart';
import 'widget/hidden_tab.dart';
import 'widget/pinned_tab.dart';
import 'widget/my_field_popup_menu_button.dart';

enum FeedFilter { feed, pinned, hidden }

class MyFieldScreen extends StatefulWidget {
  const MyFieldScreen({super.key});

  @override
  State<MyFieldScreen> createState() => _MyFieldScreenState();
}

class _MyFieldScreenState extends State<MyFieldScreen> {
  Set<FeedFilter> _selected = {FeedFilter.feed};

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: const [MyFieldPopupMenuButton()],
          centerTitle: true,
          title: SegmentedButton<FeedFilter>(
            showSelectedIcon: false,
            selected: _selected,
            segments: const [
              ButtonSegment(
                value: FeedFilter.pinned,
                label: Text('Pinned'),
              ),
              ButtonSegment(
                value: FeedFilter.feed,
                label: Text('Feed'),
              ),
              ButtonSegment(
                value: FeedFilter.hidden,
                label: Text('Hidden'),
              ),
            ],
            onSelectionChanged: (value) => setState(() => _selected = value),
          ),
        ),
        body: switch (_selected.single) {
          FeedFilter.feed => const FeedTab(),
          FeedFilter.pinned => const PinnedTab(),
          FeedFilter.hidden => const HiddenTab(),
        },
      );
}
