import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/dapp_tab.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/discovery_tab.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/nft_tab.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/quote_tab.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page/wallets_tab/wallets_tab.dart';
import 'package:yc_wallet/share/quick_import.dart';

class MainTabPage extends BasePage {
  MainTabPage(RouteConfig config) : super(config, const _MainTab());
}

final currentIndexProvider = StateProvider((ref) => 0);

class _MainTab extends ConsumerWidget {
  const _MainTab({Key? key}) : super(key: key);
  static final _titles = ["钱包", "行情", "NFT", "DAPP", "发现"];
  static final _icons = [
    Icons.wallet_giftcard,
    Icons.info_outline,
    Icons.assessment_outlined,
    Icons.app_registration,
    Icons.av_timer_sharp
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch<int>(currentIndexProvider);
    final title = _titles[currentIndex];
    return Scaffold(
      body: IndexedStack(
        children: [
          WalletsTab(),
          QuoteTab(),
          NftTab(),
          DAppTab(),
          DiscoveryTab()
        ],
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          Log.i("点击了的 ", index);
          ref.read(currentIndexProvider.state).state = index;
        },
        selectedLabelStyle: TextStyle(color: Colors.amber),
        unselectedLabelStyle: TextStyle(color: Colors.black),
        items: [
          for (var title in _titles)
            BottomNavigationBarItem(
                label: title, icon: Icon(_icons[_titles.indexOf(title)]))
        ],
      ),
    );
  }
}
