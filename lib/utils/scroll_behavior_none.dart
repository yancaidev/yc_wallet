import 'package:yc_wallet/share/quick_import.dart';

class ScrollBehaviorNone extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
