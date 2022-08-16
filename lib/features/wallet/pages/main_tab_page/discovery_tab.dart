import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';

class DiscoveryTab extends ConsumerStatefulWidget {
  const DiscoveryTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DiscoveryTabState();
}

class _DiscoveryTabState extends ConsumerState<DiscoveryTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("发现3"),
    );
  }
}
