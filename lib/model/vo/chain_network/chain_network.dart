import 'package:yc_wallet/repository/apis/moralis/models/moralis_chain/moralis_chain.dart';
import 'package:yc_wallet/share/freezed_import.dart';
part 'chain_network.freezed.dart';

@unfreezed
class ChainNetwork with _$ChainNetwork {
  factory ChainNetwork({
    required final String name,
    @Default(false) final bool isAll,
    @Default(false) bool isSelected,
    final MoralisChain? chain,
  }) = _ChainNetwork;
}
