// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coinmaketcap_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _CoinMarketCapClient implements CoinMarketCapClient {
  _CoinMarketCapClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://deep-index.moralis.io/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ListResult<IdMap>> idMap(symbols) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'symbol': symbols};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListResult<IdMap>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v1/cryptocurrency/map',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = await compute(deserializeListResult<IdMap>, _result.data!);
    return value;
  }

  @override
  Future<QuoteResult> latestQuote(symbols, convert) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'symbol': symbols,
      r'convert': convert
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<QuoteResult>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/v2/cryptocurrency/quotes/latest',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = await compute(deserializeQuoteResult, _result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
