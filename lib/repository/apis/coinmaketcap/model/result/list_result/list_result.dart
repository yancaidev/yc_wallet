import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/result/result_status/result_status.dart';

part 'list_result.freezed.dart';
part 'list_result.g.dart';

@freezed
@JsonSerializable(genericArgumentFactories: true)
class ListResult<T> with _$ListResult<T> {
  factory ListResult({List<T>? data, ResultStatus? status}) = _ListResult<T>;

  factory ListResult.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ListResultFromJson(json, fromJsonT);
  }
}
