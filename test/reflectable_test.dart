import 'package:flutter_test/flutter_test.dart';

import 'package:reflectable/reflectable.dart';
import 'package:yc_wallet/share/freezed_import.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'reflectable_test.reflectable.dart'; // Import generated code.

part 'reflectable_test.freezed.dart';
part 'reflectable_test.g.dart';

class Reflector extends Reflectable {
  const Reflector() : super(newInstanceCapability, invokingCapability);
}

const reflector = Reflector();

// class MetaReflector extends Reflectable {
//   const MetaReflector() : super(const NewInstanceMetaCapability(Person));
// }

// const metaReflector = MetaReflector();

@reflector
// @metaReflector
class Person {
  final String name;

  const Person(this.name);

  factory Person.fromName(String name) {
    return Person(name);
  }
}

@reflector
@freezed
class BaseModel with _$BaseModel {
  const factory BaseModel({required String name}) = _BaseModel;

  factory BaseModel.fromJson(Map<String, Object?> json) =>
      _$BaseModelFromJson(json);
}

void main() {
  initializeReflectable();

  test("test", () {
    assert(false, "sdd");
  });

  test("Test factory constructor with reflectable.", () {
    final personMirror = reflector.reflectType(Person) as ClassMirror;
    final person = personMirror.newInstance("fromName", ["哈哈"]) as Person?;
    assert(person != null && person.name == "哈哈", "reflection failed");
  });

  test("Test freezed and reflectable", () {
    final baseModelMirror = reflector.reflectType(BaseModel) as ClassMirror;
    try {
      final model = baseModelMirror.newInstance("fromJson", [
        {"name": "哈哈"}
      ]) as BaseModel?;
      Log.i("转换成json 为 ${model?.toJson()}");
      assert(model != null && model.name == "哈哈", "reflection failed");
    } catch (e) {
      assert(false, "Using reflection to create new instance failed.");
    }
  });
}
