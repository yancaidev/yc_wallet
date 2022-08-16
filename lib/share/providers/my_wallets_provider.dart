import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/providers/chain_networks_provider.dart';

final myWalletsDataProvider = StreamProvider((ref) {
  final walletDao = ref.watch(walletInfoDaoProvider);
  final networksProvider = ref.watch(networksNeedToTrackProvider);
  return walletDao.watchCurrentWallet();
});
