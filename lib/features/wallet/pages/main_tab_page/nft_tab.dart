import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';

class NftTab extends ConsumerStatefulWidget {
  const NftTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NftTabState();
}

class _NftTabState extends ConsumerState<NftTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        lightBackground: true,
        backgroundColor: Colors.white,
        textTitle: "NFT",
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
