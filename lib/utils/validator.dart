class Validator {
  RegExp? _passwordInputReg;
  RegExp? _passwordReg;

  Validator._();
  //  {
  //   // = RegExp(r"^\d{0,6}$");
  // (r"^\d{6}$")
  // }

  static Validator shared = Validator._();

  RegExp get passwordInputReg {
    _passwordInputReg ??= RegExp(r"^\d{0,6}$");
    return _passwordInputReg!;
  }

  RegExp get passwordReg {
    _passwordReg ??= RegExp(r"^\d{6}$");
    return _passwordInputReg!;
  }

  bool isWalletPassword(String? password) {
    return passwordReg.hasMatch(password ?? "");
  }

  bool isWalletInputingPassword(String? password) {
    return passwordInputReg.hasMatch(password ?? "");
  }
}
