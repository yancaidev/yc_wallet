import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page.dart';
import 'package:yc_wallet/features/wallet/pages/import_wallet_page.dart';
import 'package:yc_wallet/features/wallet/pages/wallet_factory_page.dart';
import 'package:yc_wallet/utils/log_utils.dart';

/// Router使用该对象
class YCRouterDetegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  ///  `navigatorKey` 用于获取当前的 `navigator`
  /// 一定要用 `navigatorKey` 创建 Navigator 对象
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  /// Record opened routes history.
  final _routeHistory = List.of([RouteConfig.home()]);

  /// `YCRouteDetegate` 构造函数，同时初始化 `navigationKey`
  YCRouterDetegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  RouteConfig? get currentConfiguration =>
      _routeHistory.length > 2 ? _routeHistory.last : RouteConfig.home();

  List<Page> get _pages =>
      _routeHistory.map((config) => _routeMapper(config)).toList();

  Page _routeMapper(RouteConfig config) {
    switch (config.routeName) {
      case RouteName.home:
        return WalletFactoryPage();
      case RouteName.createWallet:
        return CreateWalletPage();
      case RouteName.importWallet:
        return ImportWalletPage();
      default:
        throw UnsupportedError("不支持跳转到$config");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _pages,
      onPopPage: (route, result) {
        LogUtils.i("onPopPage is called");
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
    LogUtils.i("popRoute is called. ${_routeHistory.length}");
    if (_routeHistory.length == 1) {
      // LogUtils.i("Prevent navigating back because it's root route now.");
      LogUtils.i("Show confirm exit action.");
    } else {
      pop();
      LogUtils.i(
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

  void push(RouteConfig route) {
    _routeHistory.add(route);
    notifyListeners();
  }

  void pop() {
    LogUtils.i("pop is called");
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
