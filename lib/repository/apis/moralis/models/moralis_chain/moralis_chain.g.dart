// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moralis_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoralisChain _$$_MoralisChainFromJson(Map<String, dynamic> json) =>
    _$_MoralisChain(
      name: json['name'] as String,
      decimals: json['decimals'] as int,
      marketCapPlatformName: json['marketCapPlatformName'] as String,
      tokenName: json['tokenName'] as String?,
      symbol: json['symbol'] as String?,
      logo: json['logo'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_MoralisChainToJson(_$_MoralisChain instance) =>
    <String, dynamic>{
      'name': instance.name,
      'decimals': instance.decimals,
      'marketCapPlatformName': instance.marketCapPlatformName,
      'tokenName': instance.tokenName,
      'symbol': instance.symbol,
      'logo': instance.logo,
      'thumbnail': instance.thumbnail,
    };
