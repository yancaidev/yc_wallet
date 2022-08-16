import 'package:yc_wallet/share/freezed_import.dart';
part 'chain_network.freezed.dart';

@unfreezed
class ChainNetwork with _$ChainNetwork {
  factory ChainNetwork({
    required final String name,
    required final String url,
    @Default(false) final bool isAll,
    @Default(false) bool isSelected,
  }) = _ChainNetwork;
}
