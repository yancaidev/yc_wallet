import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/navigation/yc_route_infomation_parser.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final appStateProvider = StateProvider((ref) => true);

final prepareAppStateProvider = FutureProvider<bool>((ref) async {
  return UserSettings.shouldShowIntro();
});

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  final YCRouteInfomationParser routeInformationParser =
      YCRouteInfomationParser();
  YCRouterDetegate? _routerDetegate;

  Future<bool> prepareAppInitState() async {
    final showIntro = await UserSettings.shouldShowIntro();
    return showIntro;
  }

  @override
  Widget build(BuildContext context) {
    _routerDetegate ??= YCRouterDetegate(ref);
    final appState = ref.watch(prepareAppStateProvider);
    ref.listen<AsyncValue<bool>>(prepareAppStateProvider, (previous, next) {
      Log.i("读取的新值为 ${next.value}");
      ref.read(appStateProvider.state).state = next.value ?? true;
    });
    ref.listen<bool>(appStateProvider, (previous, next) {
      Log.i("应用初始化状态设置成功 $next");
      ref.read(appStateProvider.state).state = next;
    });
    return appState.when(
      loading: () {
        Log.i("应用初始化中……");
        return Container(
          color: Colors.white,
          child: const Center(
            child: Text(
              "请稍候",
              textDirection: TextDirection.ltr,
            ),
          ),
        );
      },
      error: (error, trace) {
        Log.i("应用状态初始化失败", error, trace);
        return const Center(
          child: Text(
            "程序出錯了",
            textDirection: TextDirection.ltr,
          ),
        );
      },
      data: (data) {
        Log.i("应用状态初始化成功，加载路由！");
        return MaterialApp.router(
          theme:
              ThemeData.from(colorScheme: const ColorScheme.light()).copyWith(
            buttonTheme: const ButtonThemeData(height: 56),
          ),
          routeInformationParser: routeInformationParser,
          routerDelegate: _routerDetegate!,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
