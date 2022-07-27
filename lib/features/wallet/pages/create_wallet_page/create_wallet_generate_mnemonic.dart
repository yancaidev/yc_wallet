import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class CreateWalletGenerateMnemonic extends CreateWalletBaseStep {
  const CreateWalletGenerateMnemonic({Key? key}) : super(1, key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text("生成助记词"),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => nextStep(ref), child: const Text("稍候备份")),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () => nextStep(ref), child: const Text("我已备份")),
        ],
      ),
    );
  }
}
