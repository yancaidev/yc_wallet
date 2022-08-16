import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yc_wallet/repository/apis/moralis/models/erc20/erc20.dart';
import 'package:yc_wallet/share/quick_import.dart';
part 'moralis_api.g.dart';

@RestApi(
  baseUrl: "https://deep-index.moralis.io/api/v2/",

  /// 在子线程中解析 json 和 模型间的相互转换
  parser: Parser.FlutterCompute,
)
abstract class MoralisClient {
  factory MoralisClient(Dio dio, {String baseUrl}) = _MoralisClient;

  /// 获取所有eth资产
  @GET("/{address}/balance")
  Future<Erc20> getNativeBalance(
    @Path("address") String address,
    @Query("chain") String chainName,
  );

  /// 获取所有erc20资产
  @GET("/{address}/erc20")
  Future<List<Erc20>> getTokenBalances(
    @Path("address") String address,
    @Query("chain") String chainName,
  );
}

class MoralisApi {
  static final shared = MoralisApi._internal();

  MoralisClient? _client;
  Dio? _dio;

  MoralisApi._internal();

  /// before retriving client, make sure client is initilized. Call setupClient to do so.
  static MoralisClient get client {
    if (MoralisApi.shared._client == null) throw NullThrownError();
    return MoralisApi.shared._client!;
  }

  /// initialize client
  void setupClient({
    required String apiKey,
    String baseUrl = "https://deep-index.moralis.io/api/v2/",
  }) {
    if (_dio != null && _client != null) {
      Log.w("Moralis Client has initialied, don't init it again.");
      return;
    }
    if (_dio == null || _client == null) {
      Log.i("Initializing Moralis client. ");
      _dio = Dio(BaseOptions(headers: {
        "Accept": "application/json",
        "X-API-Key": apiKey,
      }));
      _client = MoralisClient(_dio!, baseUrl: baseUrl);
    }
  }
}

// =========  在子线程中解析 json 和 模型 =========
/// [Multithreading (Flutter only)](https://mings.in/retrofit.dart/)
FutureOr<Erc20> deserializeErc20(Map<String, dynamic> json) =>
    Erc20.fromJson(json);

FutureOr<dynamic> serializeErc20(Erc20 object) => object.toJson();

FutureOr<List<Erc20>> deserializeErc20List(List<Map<String, dynamic>> json) =>
    json.map((e) => Erc20.fromJson(e)).toList();

FutureOr<dynamic> serializeErc20List(List<Erc20> objects) =>
    objects.map((e) => e.toJson()).toList();
