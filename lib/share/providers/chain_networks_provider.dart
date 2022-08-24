import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/model/vo/chain_network/chain_network.dart';
import 'package:yc_wallet/repository/apis/moralis/models/moralis_chain/moralis_chain.dart';
import 'package:yc_wallet/share/app_config.dart';

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

final morilisChainsToTrack = StateProvider((ref) {
  final networks = ref.watch(networksNeedToTrackProvider);
  return networks
      .where((element) => element.chain != null)
      .map((e) => e.chain!)
      .toList();
});

class ChainNetworksNotifier extends StateNotifier<List<ChainNetwork>> {
  ChainNetworksNotifier()
      : super([
          ChainNetwork(name: AppConfig.localized.allNetwork, isAll: true),
          ChainNetwork(
              name: "Ethereum", isSelected: true, chain: MoralisChain.ethChain),
          // ChainNetwork(
          //     name: "Ethereum Test",
          //     isSelected: false,
          //     chain: MoralisChain.ethTestChain),
          ChainNetwork(name: "BSC", chain: MoralisChain.bscChain),
          // ChainNetwork(name: "BSC Test", chain: MoralisChain.bscTestChain),
        ]);

  void switchNetwork(ChainNetwork network) {
    if (state.firstWhere((element) => element.isSelected) == network) {
      if (!AppConfig.shared.isReleaseMode) {
        state = [...state];
      }
      return;
    }
    ;

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
