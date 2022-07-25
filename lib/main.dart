import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/navigation/yc_route_infomation_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final YCRouteInfomationParser routeInformationParser =
      YCRouteInfomationParser();
  final YCRouterDetegate routerDetegate = YCRouterDetegate();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDetegate);
  }
}
