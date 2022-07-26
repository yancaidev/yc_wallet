import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class CreateWalletTips extends CreateWalletBaseStep {
  const CreateWalletTips({Key? key}) : super(0, key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text("温馨提醒"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => nextStep(ref), child: const Text("创建"))
        ],
      ),
    );
  }
}
