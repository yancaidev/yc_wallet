// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'erc20.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Erc20 _$$_Erc20FromJson(Map<String, dynamic> json) => _$_Erc20(
      tokenAddress: json['token_address'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      logo: json['logo'] as String?,
      thumbnail: json['thumbnail'] as String?,
      decimals: json['decimals'] as int?,
      balance: json['balance'] as String?,
      chain: json['chain'] == null
          ? null
          : Web3Chain.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_Erc20ToJson(_$_Erc20 instance) => <String, dynamic>{
      'token_address': instance.tokenAddress,
      'name': instance.name,
      'symbol': instance.symbol,
      'logo': instance.logo,
      'thumbnail': instance.thumbnail,
      'decimals': instance.decimals,
      'balance': instance.balance,
      'chain': instance.chain,
    };
