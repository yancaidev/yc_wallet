enum RouteName {
  home,
  notFound,
  createWallet,
  importWallet,
  main,
  walletIntro,
  setWalletPassword,
  confirmWalletPassword;

  static RouteName fromPath(String path) {
    switch (path) {
      case "/":
        return RouteName.home;
      case "/404":
        return RouteName.notFound;
      default:
        return values.firstWhere((routeName) => routeName.name == "/$path",
            orElse: () => RouteName.notFound);
    }
  }

  String get path {
    switch (this) {
      case RouteName.home:
        return "/";
      case RouteName.notFound:
        return "/404";
      default:
        return "/$name";
    }
  }
}
