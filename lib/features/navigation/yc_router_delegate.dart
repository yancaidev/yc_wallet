import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/features/wallet/pages/import_wallet_page.dart';
import 'package:yc_wallet/features/wallet/pages/main_tab_page.dart';
import 'package:yc_wallet/features/wallet/pages/wallet_factory_page.dart';
import 'package:yc_wallet/features/wallet/pages/wallet_intro_page/wallet_intro_page.dart';
import 'package:yc_wallet/main.dart';
import 'package:yc_wallet/utils/log_utils.dart';

/// Router使用该对象
class YCRouterDetegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  final WidgetRef _ref;

  ///  `navigatorKey` 用于获取当前的 `navigator`
  /// 一定要用 `navigatorKey` 创建 Navigator 对象
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Record opened routes history.
  final List<RouteConfig> _routeHistory;

  /// `YCRouteDetegate` 构造函数，同时初始化 `navigationKey`
  YCRouterDetegate(this._ref)
      : navigatorKey = GlobalKey<NavigatorState>(),
        // App启动初始栈，如果已经才看了新特性，直接进入主页，否则进入新特性页面
        _routeHistory = List.of([
          _ref.read<bool>(appStateProvider)
              ? RouteConfig(RouteName.walletIntro)
              : RouteConfig(RouteName.main)
        ]);

  @override
  RouteConfig? get currentConfiguration {
    Log.i("当前需要显示的是 ${_routeHistory.last.routeName}");
    return _routeHistory.last;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _pages,
      onPopPage: (route, result) {
        Log.i("onPopPage is called");
        if (!route.didPop(result)) {
          return false;
        }
        return _popIfNotRoot();
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    return;
  }

  @override
  Future<bool> popRoute() {
    Log.i("popRoute is called. ${_routeHistory.length}");
    if (_routeHistory.length == 1) {
      // LogUtils.i("Prevent navigating back because it's root route now.");
      Log.i("Show confirm exit action.");
    } else {
      pop();
      Log.i(
          "Navigating back and current route depth is ${_routeHistory.length}");
    }
    return Future.value(true);
  }

  /// A convenient way to retrive YCRouterDelegate instance
  static YCRouterDetegate of(BuildContext context) {
    final delegate = Router.of(context).routerDelegate;
    assert(delegate is YCRouterDetegate, 'Delegate type must match');
    return delegate as YCRouterDetegate;
  }

  BasePage _routeMapper(RouteConfig config) {
    switch (config.routeName) {
      case RouteName.home:
        return WalletFactoryPage(config);
      case RouteName.createWallet:
        return CreateWalletPage(config);
      case RouteName.importWallet:
        return ImportWalletPage(config);
      case RouteName.main:
        return MainTabPage(config);
      case RouteName.walletIntro:
        return WalletIntroPage(config);
      default:
        throw UnsupportedError("不支持跳转到$config");
    }
  }

  List<BasePage> get _pages {
    final pages = List<BasePage>.of([]);
    for (int i = 0; i < _routeHistory.length; i++) {
      final page = _routeMapper(_routeHistory[i]);
      final config = _routeHistory[i];
      if (i == _routeHistory.length - 1) {
        if (!config.isTop) {
          page.onBecomingTop();
        }
        config.makeTop(true);
      } else {
        if (config.isTop) {
          page.onLeavingTop();
        }
        config.makeTop(false);
      }
      pages.add(page);
    }
    return pages;
  }

  /// 将新路由放在栈顶，将旧的栈顶移除掉
  void replaceTop(RouteConfig route) {
    _routeHistory.add(route);
    _routeHistory.removeAt(_routeHistory.length - 2);
    notifyListeners();
  }

  /// 清空路由，仅保留当前路由
  void clearAndPush(RouteConfig route) {
    _routeHistory.clear();
    _routeHistory.add(route);
    notifyListeners();
  }

  /// 新路由放在栈顶
  void push(RouteConfig route) {
    _routeHistory.add(route);
    notifyListeners();
  }

  /// 移除栈顶
  void pop() {
    Log.i("pop is called");
    _popIfNotRoot();
  }

  bool _popIfNotRoot() {
    if (_routeHistory.length > 1) {
      _routeHistory.removeLast();
      notifyListeners();
      return true;
    }
    return false;
  }
}
