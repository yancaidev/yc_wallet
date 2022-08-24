import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/extensions/string_ext.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/appbar_action.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/appbar_leading.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/nested_scrollview_tabbarview.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/nft_cell.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/token_cell.dart';
import 'package:yc_wallet/repository/apis/moralis/models/erc20/erc20.dart';
import 'package:yc_wallet/share/providers/chain_networks_provider.dart';
import 'package:yc_wallet/share/providers/my_wallets_provider.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/token_amount_converter.dart';
import 'package:yc_wallet/widgets/base_app_bar.dart';
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
  final List<Erc20> _tokens = List<Erc20>.of([]);
  final List<Object> _nfts = List.of([]);
  var _totalValue = 0.0;

  @override
  void initState() {
    super.initState();
    _tabs = List.of([
      _Tab(title: AppConfig.localized.tokens, id: 1),
      _Tab(title: AppConfig.localized.nft, id: 2),
    ]);
    Log.i("组件初始化");
    // _getMyTokens();
  }

  void _getMyTokens() {
    final wallet = ref.read(currentWalletProvider).value;
    final chains = ref.read(morilisChainsToTrack);
    var address = wallet?.address;
    if (!AppConfig.shared.isReleaseMode) {
      // address = "0x81b7e08f65bdf5648606c89998a9cc8164397647";
      // return;
    }

    if (address == null) {
      return;
    }
    ref.read(myTokensProvider.notifier).getTokenList(address, chains);
  }

  @override
  Widget build(BuildContext context) {
    Log.i("组件build...");
    final myTokens = ref.watch(myTokensProvider);
    final currentWallet = ref.watch(currentWalletProvider);
    myTokens.when(
      init: (() {}),
      loading: () {
        // showLoading();
      },
      error: (error) {
        dismissLoading();
      },
      success: (result) {
        _tokens.clear();
        _tokens.addAll(result);
        _totalValue = _tokens
            .map((e) => e.total)
            .reduce((value, element) => value + element);
        dismissLoading();
      },
    );

    ref.listen(currentWalletProvider, (previous, next) {
      Log.i("钱包变化了 $previous $next");
      _getMyTokens();
    });

    ref.listen(morilisChainsToTrack, (previous, next) {
      Log.i("网络变化了 $previous $next");
      _getMyTokens();
    });

    Log.i("拉取myTokens状态 $myTokens");
    return NestedScrollViewTabbarView<_Tab>(
      appBar: const BaseAppBar(
        leading: AppBarLeading(),
        actions: [AppBarAction()],
        lightBackground: true,
        elevation: 0,
        leadingWidth: 160,
        backgroundColor: Color(0xfff5f5f5),
      ),
      header: Container(
        color: const Color(0xfff5f5f5),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _AddressRow(address: currentWallet.value?.address ?? ""),
            const SizedBox(height: 10),
            _ValueRow(totalValue: "$rmbMark ${keepDecimal(_totalValue)}"),
            const SizedBox(height: 10),
            const _ActionsRow(),
            const SizedBox(height: 10),
          ],
        ),
      ),
      tabs: _tabs,
      pinnedAppBarBuilder: (bool forceElevated) {
        return SliverAppBar(
          pinned: true,
          leadingWidth: 200,
          backgroundColor: Colors.white,
          forceElevated: false,
          leading: Container(
            padding: const EdgeInsets.only(left: 10),
            child: TabBar(
              labelPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.black54,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: _tabs.map((e) => Tab(text: e.title)).toList(),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // _getIdMap();
                // _getLatestQuote();
                showToast("搜索代币");
              },
              icon: const Icon(Icons.search),
              color: Colors.black87,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              color: Colors.black87,
            ),
          ],
        );
      },
      tabBuilder: (_Tab tab) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(((context, index) {
            return tab.id == 1 ? TokenCell(token: _tokens[index]) : NftCell();
          }), childCount: tab.id == 1 ? _tokens.length : _nfts.length),
        );
      },
    );
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
        // const _ContextTest(),
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

class _ContextTest extends StatefulWidget {
  const _ContextTest({Key? key}) : super(key: key);

  @override
  State<_ContextTest> createState() => __ContextTestState();
}

class __ContextTestState extends State<_ContextTest> {
  void _onPress(BuildContext context) {
    Log.d("context: $context;  this.context: ${this.context}");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: const Text(
          "点我",
        ),
        onPressed: () => _onPress(context),
      ),
    );
  }
}
