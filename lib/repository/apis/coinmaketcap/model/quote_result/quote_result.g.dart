// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuoteResult _$$_QuoteResultFromJson(Map<String, dynamic> json) =>
    _$_QuoteResult(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => CurrencyQuote.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      status: json['status'] == null
          ? null
          : ResultStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_QuoteResultToJson(_$_QuoteResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };
