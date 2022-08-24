import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:reflectable/reflectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yc_wallet/helper/reflectable.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/currency_quote/currency_quote.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/id_map/id_map.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/quote_result/quote_result.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/result/list_result/list_result.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/result/result.dart';
import 'package:yc_wallet/share/quick_import.dart';
part 'coinmaketcap_api.g.dart';

/// Moralis Api 客户端
@RestApi(
  baseUrl: "https://deep-index.moralis.io/api/",
  parser: Parser.FlutterCompute,
)
abstract class CoinMarketCapClient {
  factory CoinMarketCapClient(Dio dio, {String baseUrl}) = _CoinMarketCapClient;

  /// deprecated ~[idMap]~ ，找不到代币时，会报异常，弃用；
  ///
  /// 获取所有代币id
  /// - [symbols] 代币 symbol 列表，用英文逗号隔开
  @GET("/v1/cryptocurrency/map")
  Future<ListResult<IdMap>> idMap(@Query("symbol") String symbols);

  /// 获取代币最新行情
  /// - [symbols] 代币 symbol 列表，用英文逗号隔开;
  /// - [convert] 货币单位 `CNY`, `USD`,  [货币列表参照链接](https://coinmarketcap.com/api/documentation/v1/#section/Standards-and-Conventions)
  @GET("/v2/cryptocurrency/quotes/latest")
  Future<QuoteResult> latestQuote(
    @Query("symbol") String symbols,
    @Query("convert") String convert,
  );
}

/// Moralis Api  接口
class CoinMarketCapApi {
  static final shared = CoinMarketCapApi._internal();

  CoinMarketCapClient? _client;
  Dio? _dio;

  CoinMarketCapApi._internal();

  /// before retriving client, make sure client is initilized. Call setupClient to do so.
  static CoinMarketCapClient get client {
    if (CoinMarketCapApi.shared._client == null) throw NullThrownError();
    return CoinMarketCapApi.shared._client!;
  }

  /// initialize client
  void setupClient({
    required String apiKey,
    String baseUrl = "https://deep-index.moralis.io/api/v2/",
  }) {
    if (_dio != null && _client != null) {
      Log.w("CoinMarketCap Client has initialied, don't init it again.");
      return;
    }
    if (_dio == null || _client == null) {
      Log.i("Initializing CoinMarketCap client. ");
      _dio = Dio(
        BaseOptions(
          headers: {
            "Accept": "application/json",
            "Accept-Encoding": "deflate, gzip",
            "X-CMC_PRO_API_KEY": apiKey,
          },
          sendTimeout: 15000,
          connectTimeout: 5000,
          receiveTimeout: 15000,
        ),
      )..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              Log.i("请求中");
              handler.next(options);
            },
            onError: (error, handler) {
              Log.i("出错了");
              if (error.response != null) {}
              handler.next(error);
            },
            onResponse: (response, handler) {
              Log.i("响应");
              handler.next(response);
            },
          ),
        );

      _client = CoinMarketCapClient(_dio!, baseUrl: baseUrl);
    }
  }
}

// =========  在子线程中解析 json 和 模型 =========
/// [Multithreading (Flutter only)](https://mings.in/retrofit.dart/)

T fromJson<T>(Object? json) {
  final classMirror = reflector.reflect(T) as ClassMirror;
  return classMirror.newInstance("fromJson", [json]) as T;
}

FutureOr<ListResult<T>> deserializeListResult<T>(Map<String, dynamic> json) =>
    ListResult<T>.fromJson(json, fromJson);

FutureOr<QuoteResult> deserializeQuoteResult(Map<String, dynamic> json) =>
    QuoteResult.fromJson(json);
