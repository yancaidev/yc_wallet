enum RouteName {
  home,
  notFound,
  createWallet,
  importWallet;

  static RouteName fromPath(String path) {
    switch (path) {
      case "/":
        return RouteName.home;
      case "/create-wallet":
        return RouteName.createWallet;
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
      default:
        return "/404";
    }
  }
}
