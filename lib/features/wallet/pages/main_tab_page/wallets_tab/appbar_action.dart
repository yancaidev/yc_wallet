import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/model/vo/chain_network/chain_network.dart';
import 'package:yc_wallet/share/providers/chain_networks_provider.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/password_pad.dart';
import 'package:yc_wallet/widgets/sheet_box.dart';

class AppBarAction extends ConsumerWidget {
  const AppBarAction({Key? key}) : super(key: key);

  void _showSelectNetworkDialog() {
    showSlideUpDialog(
      _NetworkList(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final network = ref.watch(selectedNetworkProvider);
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              primary: Colors.black,
              backgroundColor: Colors.white,
              padding: const EdgeInsets.only(left: 16, right: 8),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(),
                  borderRadius: BorderRadius.circular(100))),
          onPressed: _showSelectNetworkDialog,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(network.name),
              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black38,
              ),
            ],
          )),
    );
  }
}

class _NetworkList extends ConsumerWidget {
  const _NetworkList({Key? key}) : super(key: key);

  void _updateSelectedNetwork(
    BuildContext context,
    WidgetRef ref,
    ChainNetwork network,
  ) {
    ref.read(supporttedNetworksProvider.notifier).switchNetwork(network);
    hideSlideUpDialog();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allNetworks = ref.watch(supporttedNetworksProvider);

    final children = allNetworks
        .map((network) => ListTile(
              title: Text(network.name),
              onTap: () => _updateSelectedNetwork(context, ref, network),
              selected: network.isSelected,
              trailing: Checkbox(
                value: network.isSelected,
                onChanged: null,
                fillColor: MaterialStateProperty.all(Colors.transparent),
                checkColor: Theme.of(context).primaryColor,
              ),
            ))
        .toList();

    return SheetBox(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ToolBar(
          titleText: "选择网络",
          onClose: hideSlideUpDialog,
        ),
        ...children
      ],
    ));
  }
}
