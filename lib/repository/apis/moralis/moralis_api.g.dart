// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moralis_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MoralisClient implements MoralisClient {
  _MoralisClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://deep-index.moralis.io/api/v2/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Erc20> getNativeBalance(address, chainName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'chain': chainName};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Erc20>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/${address}/balance',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = await compute(deserializeErc20, _result.data!);
    return value;
  }

  @override
  Future<List<Erc20>> getTokenBalances(address, chainName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'chain': chainName};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Erc20>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/${address}/erc20',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = await compute(
        deserializeErc20List, _result.data!.cast<Map<String, dynamic>>());
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
