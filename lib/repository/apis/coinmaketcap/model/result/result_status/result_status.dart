import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_status.freezed.dart';
part 'result_status.g.dart';

@freezed
class ResultStatus with _$ResultStatus {
  factory ResultStatus({
    DateTime? timestamp,
    @JsonKey(name: 'error_code') int? errorCode,
    @JsonKey(name: 'error_message') String? errorMessage,
    int? elapsed,
    @JsonKey(name: 'credit_count') int? creditCount,
  }) = _ResultStatus;

  factory ResultStatus.fromJson(Map<String, dynamic> json) =>
      _$ResultStatusFromJson(json);
}
