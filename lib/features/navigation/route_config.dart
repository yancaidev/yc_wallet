import 'package:yc_wallet/features/navigation/route_name.dart';

class RouteConfig {
  RouteName routeName;

  RouteConfig(this.routeName);

  RouteConfig.newRoute(String path) : routeName = RouteName.fromPath(path);

  RouteConfig.notFound() : routeName = RouteName.notFound;

  RouteConfig.home() : routeName = RouteName.home;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteConfig &&
          runtimeType == other.runtimeType &&
          routeName == other.routeName;

  @override
  int get hashCode => routeName.hashCode;
}
