import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/model/do/chain_network.dart';

/// 所有支持的网络列表
final supporttedNetworksProvider =
    StateNotifierProvider<ChainNetworksNotifier, List<ChainNetwork>>((ref) {
  return ChainNetworksNotifier();
});

/// 当前选中的网络
final selectedNetworkProvider = StateProvider((ref) {
  final all = ref.watch(supporttedNetworksProvider);
  return all.firstWhere((element) => element.isSelected);
});

///  需要追踪数据的网络
final networksNeedToTrackProvider = StateProvider((ref) {
  final allNetworks = ref.watch(supporttedNetworksProvider);

  if (allNetworks[0].isSelected) {
    return allNetworks.where((element) => !element.isAll).toList();
  }
  return allNetworks
      .where((element) => !element.isAll && element.isSelected)
      .toList();
});

class ChainNetworksNotifier extends StateNotifier<List<ChainNetwork>> {
  ChainNetworksNotifier()
      : super([
          ChainNetwork(name: "全部网络", url: "", isAll: true),
          ChainNetwork(name: "Ethereum", url: "", isSelected: true),
          ChainNetwork(name: "BSC", url: ""),
        ]);

  void switchNetwork(ChainNetwork network) {
    state = [
      for (final cn in state)
        if (cn.isSelected)
          cn.copyWith(isSelected: false)
        else if (cn == network)
          network.copyWith(isSelected: true)
        else
          cn
    ];
  }
}
