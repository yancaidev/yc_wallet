import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';

class NftCell extends ConsumerWidget {
  const NftCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const CircleAvatar(child: Icon(Icons.contact_page, size: 28)),
      title: const Text("NFT", style: TextStyle(fontWeight: FontWeight.w500)),
      trailing: Text("0"),
    );
  }
}
