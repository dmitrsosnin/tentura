import 'package:gravity/ui/ferry_utils.dart';

import 'widget/hidden_tab.dart';
import 'widget/pinned_tab.dart';
import 'widget/recommended_tab.dart';
import 'widget/my_field_popup_menu_button.dart';

class MyFieldScreen extends StatelessWidget {
  const MyFieldScreen({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            actions: const [MyFieldPopupMenuButton()],
            bottom: const TabBar(
              tabs: [
                Text('Pinned'),
                Text('Recommended'),
                Text('Hidden'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PinnedTab(),
              RecommendedTab(),
              HiddenTab(),
            ],
          ),
        ),
      );
}
