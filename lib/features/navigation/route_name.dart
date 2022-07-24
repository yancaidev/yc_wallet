enum RouteName {
  home,
  notFound,
  createWallet,
  importWallet,
  mainTab;

  static RouteName fromPath(String path) {
    switch (path) {
      case "/":
        return RouteName.home;
      case "/create-wallet":
        return RouteName.createWallet;
      case "/main":
        return RouteName.mainTab;
      default:
        return RouteName.notFound;
    }
  }

  String get path {
    switch (this) {
      case RouteName.home:
        return "/";
      case RouteName.createWallet:
        return "/create-wallet";
      case RouteName.mainTab:
        return "/main";
      default:
        return "/404";
    }
  }
}
