import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/navigation/yc_route_infomation_parser.dart';
import 'package:yc_wallet/share/app_state.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(key: AppConfig.appKey),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  YCRouterDetegate? _routerDetegate;

  @override
  void initState() {
    super.initState();
    Log.i("start------------");
    print("first").then((value) {
      Log.i("middle ========= $value");
    });
    print("second").then((value) {
      Log.i("middle ========= $value");
    });
    Log.i("end----------");
  }

  Future<String> print(String tag) async {
    return Future.delayed(const Duration(seconds: 1), (() => "$tag ==="));
  }

  @override
  Widget build(BuildContext context) {
    final appState = ref.watch(prepareAppStateProvider);
    ref.listen<AsyncValue<AppState>>(prepareAppStateProvider, (previous, next) {
      Log.i("读取的新值为 ${next.value}");

      ref.read(appStateProvider.state).state = next.value!;
    });
    ref.listen<AppState?>(appStateProvider, (previous, next) {
      Log.i("应用初始化状态设置成功 $next");
      ref.read(appStateProvider.state).state = next!;
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
          theme: ThemeData.from(
            colorScheme: const ColorScheme.light(),
          ).copyWith(
            buttonTheme: const ButtonThemeData(height: 56),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          routeInformationParser: YCRouteInfomationParser(),
          routerDelegate: _routerDetegate ??= YCRouterDetegate(ref),
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    /// 关闭数据库
    ref.read(databaseProvider).close();
  }
}
