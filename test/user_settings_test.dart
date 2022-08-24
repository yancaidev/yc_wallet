import 'package:flutter_test/flutter_test.dart';
import 'dart:core';

import 'package:yc_wallet/share/user_settings.dart';

void main() {
  test("test saving and retrive wallet password", () async {
    await UserSettings.setWalletPassword("123456");
    final password = await UserSettings.getPassword();
    final isRight = await UserSettings.isPasswordRight("123456");
    assert(isRight, "secure storage not working.");
  });
  // initializeReflectable();

  // test("Test factory constructor with reflectable.", () {
  //   Reflector reflector = const Reflector();
  //   final personMirror = reflector.reflectType(Person) as ClassMirror;
  //   final person = personMirror.newInstance("fromName", ["哈哈"]) as Person;
  //   Log.i("The name of the person instance by reflectable is ${person.name}");
  // });
}
