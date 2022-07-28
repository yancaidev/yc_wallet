import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/share/quick_import.dart';

class _TopRecorder {
  bool isTop;
  _TopRecorder(this.isTop);
}

class RouteConfig {
  final RouteName routeName;

  final _TopRecorder _topRecorder = _TopRecorder(false);

  bool? isRouteCreated;

  RouteConfig(this.routeName);

  RouteConfig.notFound() : this(RouteName.notFound);

  RouteConfig.home() : this(RouteName.home);

  RouteConfig.main() : this(RouteName.main);

  RouteConfig.newRoute(String path) : this(RouteName.fromPath(path));

  bool get isTop => _topRecorder.isTop;

  void makeTop(bool top) {
    _topRecorder.isTop = top;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RouteConfig &&
          runtimeType == other.runtimeType &&
          routeName == other.routeName;

  @override
  int get hashCode => routeName.hashCode;

  @override
  String toString() {
    if (AppConfig.shared.isReleaseMode) {
      return super.toString();
    }
    return "Routename: ${routeName.name}; path: ${routeName.path}, isTop: $isTop";
  }
}
