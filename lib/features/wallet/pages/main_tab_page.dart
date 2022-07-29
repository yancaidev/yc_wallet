import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class MainTabPage extends BasePage {
  MainTabPage(RouteConfig config) : super(config, const _MainTab());
}

final currentIndexProvider = StateProvider((ref) => 0);

class _MainTab extends ConsumerWidget {
  const _MainTab({Key? key}) : super(key: key);
  static final _titles = ["钱包", "资产", "我"];
  static final _icons = [Icons.home, Icons.phone, Icons.email];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch<int>(currentIndexProvider);
    final title = _titles[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Text("Body $currentIndex"),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          Log.i("点击了的 ", index);
          ref.read(currentIndexProvider.state).state = index;
        },
        items: [
          for (var title in _titles)
            BottomNavigationBarItem(
                label: title, icon: Icon(_icons[_titles.indexOf(title)]))
        ],
      ),
    );
  }
}
