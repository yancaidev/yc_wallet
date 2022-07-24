import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';

class YCRouteInfomationParser extends RouteInformationParser<RouteConfig> {
  @override
  Future<RouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.isEmpty) {
      return RouteConfig(RouteName.home);
    }
    if (uri.pathSegments.length == 1) {
      return RouteConfig.newRoute(uri.pathSegments.first);
    }
    return RouteConfig(RouteName.notFound);
  }
}
