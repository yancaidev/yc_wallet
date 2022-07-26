import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';

class YCRouteInfomationParser extends RouteInformationParser<RouteConfig> {
  @override
  Future<RouteConfig> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    Log.i("导航路径 $uri ${uri.pathSegments}");
    final showIntro = await UserSettings.shouldShowIntro();
    if (uri.pathSegments.isEmpty) {
      return RouteConfig(showIntro ? RouteName.walletIntro : RouteName.main);
    }
    if (uri.pathSegments.length == 1) {
      return RouteConfig.newRoute(uri.pathSegments.first);
    }
    return RouteConfig(RouteName.notFound);
  }

  @override
  RouteInformation? restoreRouteInformation(RouteConfig configuration) {
    return RouteInformation(location: configuration.routeName.path);
  }
}
