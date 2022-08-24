import 'package:freezed_annotation/freezed_annotation.dart';

import 'result_status/result_status.dart';

part 'result.freezed.dart';
part 'result.g.dart';

/// CoinMarketCap Api result
///
/// [freezed 泛型支持示例](https://stackoverflow.com/questions/67856555/json-serializable-add-a-generic-field-to-a-freezed-json-serializable-class)
@freezed
@JsonSerializable(genericArgumentFactories: true)
class Result<T> with _$Result<T> {
  const factory Result({
    T? data,
    ResultStatus? status,
  }) = _Result<T>;

  factory Result.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ResultFromJson<T>(json, fromJsonT);
  }

  // Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
  //   return _$ResultToJson<T>(this, toJsonT);
  // }
}
