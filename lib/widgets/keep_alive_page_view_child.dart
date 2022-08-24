import 'package:yc_wallet/share/quick_import.dart';

class KeepAlivePageViewChild extends StatefulWidget {
  final Widget child;

  const KeepAlivePageViewChild({Key? key, required this.child})
      : super(key: key);

  @override
  State<KeepAlivePageViewChild> createState() => _KeepAlivePageViewChildState();
}

class _KeepAlivePageViewChildState extends State<KeepAlivePageViewChild>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
