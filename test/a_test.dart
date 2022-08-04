import 'package:flutter_test/flutter_test.dart';
import 'dart:core';

void main() {
  test("test", () {
    assert(false, "sdd");
  });
  // initializeReflectable();

  // test("Test factory constructor with reflectable.", () {
  //   Reflector reflector = const Reflector();
  //   final personMirror = reflector.reflectType(Person) as ClassMirror;
  //   final person = personMirror.newInstance("fromName", ["哈哈"]) as Person;
  //   Log.i("The name of the person instance by reflectable is ${person.name}");
  // });
}
