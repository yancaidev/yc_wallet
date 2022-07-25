import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/share/quick_import.dart';

class MainTabPage extends BasePage {
  MainTabPage() : super(RouteName.main, const _MainTab());
}

final currentIndexProvider = StateProvider((ref) => 0);

class _MainTab extends ConsumerWidget {
  const _MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBar"),
        centerTitle: true,
        leading: null,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Text("Body $currentIndex"),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          Log.i("点击了 ", index);
          ref.read(currentIndexProvider.state).state = index;
        },
        items: const [
          BottomNavigationBarItem(label: "钱包", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "资产", icon: Icon(Icons.phone)),
          BottomNavigationBarItem(label: "我", icon: Icon(Icons.email))
        ],
      ),
    );
  }
}
