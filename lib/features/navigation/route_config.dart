import 'package:yc_wallet/features/navigation/route_name.dart';

class RouteConfig {
  RouteName routeName;

  RouteConfig(this.routeName);

  RouteConfig.newRoute(String path) : routeName = RouteName.fromPath(path);

  RouteConfig.notFound() : routeName = RouteName.notFound;

  RouteConfig.home() : routeName = RouteName.home;
}
