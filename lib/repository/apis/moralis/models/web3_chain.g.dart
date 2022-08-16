// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web3_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Web3Chain _$$_Web3ChainFromJson(Map<String, dynamic> json) => _$_Web3Chain(
      chainType: $enumDecode(_$ChainTypeEnumMap, json['chainType']),
      name: json['name'] as String,
      symbol: json['symbol'] as String?,
      logo: json['logo'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_Web3ChainToJson(_$_Web3Chain instance) =>
    <String, dynamic>{
      'chainType': _$ChainTypeEnumMap[instance.chainType]!,
      'name': instance.name,
      'symbol': instance.symbol,
      'logo': instance.logo,
      'thumbnail': instance.thumbnail,
    };

const _$ChainTypeEnumMap = {
  ChainType.eth: 'eth',
  ChainType.ethTest: 'ethTest',
  ChainType.bsc: 'bsc',
  ChainType.bscTest: 'bscTest',
};
