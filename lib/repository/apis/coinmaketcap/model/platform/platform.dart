import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform.freezed.dart';
part 'platform.g.dart';

@freezed
class Platform with _$Platform {
  factory Platform({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    @JsonKey(name: 'token_address') String? tokenAddress,
  }) = _Platform;

  factory Platform.fromJson(Map<String, dynamic> json) =>
      _$PlatformFromJson(json);
}
