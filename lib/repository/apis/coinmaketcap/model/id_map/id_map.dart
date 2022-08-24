import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/helper/reflectable.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/platform/platform.dart';

part 'id_map.freezed.dart';
part 'id_map.g.dart';

@freezed
@reflector
class IdMap with _$IdMap {
  factory IdMap({
    int? id,
    int? rank,
    String? name,
    String? symbol,
    String? slug,
    Platform? platform,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'first_historical_data') DateTime? firstHistoricalData,
    @JsonKey(name: 'last_historical_data') DateTime? lastHistoricalData,
  }) = _IdMap;

  factory IdMap.fromJson(Map<String, dynamic> json) => _$IdMapFromJson(json);
}
