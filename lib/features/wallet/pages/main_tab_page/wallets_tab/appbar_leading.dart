import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';
import 'package:yc_wallet/services/wallet_service.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/password_pad.dart';
import 'package:yc_wallet/widgets/sheet_box.dart';

class AppBarLeading extends ConsumerWidget {
  const AppBarLeading({Key? key}) : super(key: key);

  void _switchWalletDialog(BuildContext context) {
    showSlideUpDialog(_MyWalletList(
      pageContext: context,
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletInfoDao = ref.watch(walletInfoDaoProvider);
    final currentWallet = walletInfoDao.watchCurrentWallet();
    walletInfoDao.watchMyWallets;

    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.black,
        padding: const EdgeInsets.only(left: 16, right: 8),
      ),
      onPressed: () => _switchWalletDialog(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: StreamBuilder(
              builder: (context, snapshot) {
                final wallet = snapshot.data as WalletInfo?;
                return Text(
                  wallet?.name ??
                      "${AppConfig.localized.tabWallet} ${wallet?.id ?? ''}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                );
              },
              stream: currentWallet,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down_outlined,
            color: Colors.black38,
          ),
        ],
      ),
    );
  }
}

class _MyWalletList extends ConsumerWidget {
  final BuildContext pageContext;
  const _MyWalletList({Key? key, required this.pageContext}) : super(key: key);

  /// 新增钱包
  void _onAddWalletPressed() {
    hideSlideUpDialog();
    YCRouterDetegate.of(pageContext).push(RouteConfig.home());
  }

  /// 切换钱包
  void _switchWallet(WidgetRef ref, WalletInfo walletInfo) async {
    hideSlideUpDialog();
    await ref
        .read(walletInfoDaoProvider)
        .setCurrentWalletByAddress(walletInfo.address);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletDao = ref.watch(walletInfoDaoProvider);
    walletDao.watchMyWallets;
    return StreamBuilder(
      stream: walletDao.watchMyWallets(),
      builder: (context, snapshot) {
        final children = snapshot.data == null
            ? [const SizedBox(height: 200)]
            : (snapshot.data as List<WalletInfo>)
                .map((wallet) => ListTile(
                      dense: false,
                      minVerticalPadding: 10,
                      title: Text(
                        wallet.name ?? "钱包${wallet.id}",
                        style: TextStyle(
                          color: wallet.isCurrent
                              ? Theme.of(context).primaryColor
                              : Colors.black,
                        ),
                      ),
                      subtitle: Text(
                        wallet.address,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      onTap: () => _switchWallet(ref, wallet),
                      selected: wallet.isCurrent,
                      trailing: Checkbox(
                        value: wallet.isCurrent,
                        onChanged: null,
                        fillColor:
                            MaterialStateProperty.all(Colors.transparent),
                        checkColor: Theme.of(context).primaryColor,
                      ),
                    ))
                .toList();
        return SheetBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const ToolBar(
                titleText: "选择钱包",
                onClose: hideSlideUpDialog,
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...children,
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                child: elevatedButton(
                  "添加钱包",
                  onPressed: _onAddWalletPressed,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
