import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/appbar_action.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/appbar_leading.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/nested_scrollview_tabbarview.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';
import 'package:yc_wallet/repository/apis/moralis/models/web3_chain.dart';
import 'package:yc_wallet/repository/apis/moralis/moralis_api.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';
import 'package:yc_wallet/services/wallet_service.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/providers/chain_networks_provider.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:path/path.dart';
import 'package:yc_wallet/widgets/rounded_outlined_button.dart';

class WalletsTab extends ConsumerStatefulWidget {
  const WalletsTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletsTabState();
}

class _Tab extends TabModel {
  final int id;
  _Tab({required String title, required this.id}) : super(title: title);
}

class _WalletsTabState extends ConsumerState<WalletsTab> {
  late List<_Tab> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = List.of([
      _Tab(title: "代币", id: 1),
      _Tab(title: "藏品", id: 2),
    ]);
    _listAllWallets();
  }

  void _listAllWallets() async {
    final allWallets = await ref.read(walletInfoDaoProvider).allWallets;
    Log.i("钱包列表 $allWallets");
    await ref.read(walletInfoDaoProvider).deleteWalletByAddress("address");
    final allWallets2 = await ref.read(walletInfoDaoProvider).allWallets;
    Log.i("钱包列表 $allWallets2");
  }

  void _featchData() async {
    final result = await getBalances(
      "0x81b7e08f65bdf5648606c89998a9cc8164397647",
      Web3Chain(chainType: ChainType.ethTest, name: Web3Chain.ethTest),
    );
    Log.i("请求结果 ${jsonEncode(result)}");
  }

  @override
  Widget build(BuildContext context) {
    final walletDao = ref.watch(walletInfoDaoProvider);
    final networks = ref.watch(networksNeedToTrackProvider);

    return NestedScrollViewTabbarView<_Tab>(
        appBar: const BaseAppBar(
          leading: AppBarLeading(),
          actions: [AppBarAction()],
          lightBackground: true,
          elevation: 0,
          leadingWidth: 100,
          backgroundColor: Color(0xfff5f5f5),
        ),
        header: Container(
          color: Color(0xfff5f5f5),
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _AddressRow(address: "得瑟得瑟"),
              const SizedBox(height: 10),
              _ValueRow(totalValue: "\$0.00"),
              const SizedBox(height: 10),
              _ActionsRow(),
              SizedBox(height: 10),
            ],
          ),
        ),
        tabs: _tabs,
        tabBuilder: (_Tab tab) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              ((context, index) {
                return Container(
                  color: Colors.white,
                  height: 100,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Center(
                    child: Text("${tab.title} $index"),
                  ),
                );
              }),
            ),
          );
        },
        pinnedAppBarBuilder: (bool forceElevated) {
          return SliverAppBar(
            pinned: true,
            leadingWidth: 160,
            backgroundColor: Colors.white,
            forceElevated: forceElevated,
            leading: TabBar(
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _tabs.map((e) => Tab(text: e.title)).toList(),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  _featchData();
                },
                icon: Icon(Icons.search),
                color: Colors.black87,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: Colors.black87,
              ),
            ],
          );
        });
  }
}

/// 地址/复制地址/汽油价格
class _AddressRow extends ConsumerWidget {
  final String address;
  const _AddressRow({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 30,
          child: TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {},
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    address,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.black45, overflow: TextOverflow.ellipsis),
                  ),
                ),
                const Icon(
                  Icons.copy,
                  color: Colors.black45,
                  size: 16,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// 总价值行
class _ValueRow extends ConsumerWidget {
  final String totalValue;
  final VoidCallback? onPressed;
  const _ValueRow({Key? key, required this.totalValue, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(
          totalValue,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        IconButton(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 8,
            top: 8,
          ),
          iconSize: 16,
          onPressed: onPressed,
          icon: const Icon(
            Icons.visibility,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}

class _ActionsRow extends ConsumerWidget {
  const _ActionsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RoundedOutlinedButton(
          onPressed: () {},
          child: Icon(Icons.qr_code_scanner_outlined, size: 20),
        ),
        RoundedOutlinedButton(
          onPressed: () {},
          child: Icon(Icons.qr_code, size: 20),
        ),
        RoundedOutlinedButton(
          onPressed: () {},
          child: Icon(Icons.send, size: 20),
        ),
        RoundedOutlinedButton(
          onPressed: () {},
          child: Icon(Icons.shopping_bag_outlined, size: 20),
        ),
      ],
    );
  }
}
