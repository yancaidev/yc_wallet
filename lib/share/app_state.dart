import 'package:yc_wallet/repository/database/wallet_database.dart';

class AppState {
  bool showIntro;
  bool isWalletPasswordSetted;
  WalletInfo? currentWallet;

  AppState(
      {this.showIntro = true,
      this.isWalletPasswordSetted = false,
      this.currentWallet});
}
