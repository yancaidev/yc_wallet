import 'package:flutter/material.dart';
import 'package:yc_wallet/features/navigation/route_name.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';

class MainTabPage extends BasePage {
  MainTabPage()
      : super(
            RouteName.mainTab,
            Scaffold(
              appBar: AppBar(
                title: const Text("TabBar"),
                centerTitle: true,
                leading: null,
                automaticallyImplyLeading: false,
              ),
              body: const Text("Body"),
              bottomNavigationBar: BottomNavigationBar(items: const [
                BottomNavigationBarItem(label: "钱包", icon: Icon(Icons.home)),
                BottomNavigationBarItem(label: "资产", icon: Icon(Icons.phone)),
                BottomNavigationBarItem(label: "我", icon: Icon(Icons.email))
              ]),
            ));
}
