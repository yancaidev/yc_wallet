import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/model/pair.dart';
import 'package:yc_wallet/model/vo/loading_task/loading_task.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/coinmaketcap_api.dart';
import 'package:yc_wallet/repository/apis/moralis/models/erc20/erc20.dart';
import 'package:yc_wallet/repository/apis/moralis/models/moralis_chain/moralis_chain.dart';
import 'package:yc_wallet/services/wallet_service.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/providers/chain_networks_provider.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/validator.dart';

final currentWalletProvider = StreamProvider((ref) {
  final daoProvider = ref.watch(walletInfoDaoProvider);
  return daoProvider.watchCurrentWallet();
});

final myNftsProvider = FutureProvider((ref) {
  final walletDao = ref.watch(walletInfoDaoProvider);
  final networks = ref.watch(networksNeedToTrackProvider);
  final currentWallet = walletDao.findCurrentWallet();
});

final myTokensProvider =
    StateNotifierProvider<MyTokensNotifier, LoadingTask<List<Erc20>>>((ref) {
  return MyTokensNotifier();
});

class MyTokensNotifier extends StateNotifier<LoadingTask<List<Erc20>>> {
  MyTokensNotifier() : super(const LoadingTask.init());

  void getTokenList(String address, List<MoralisChain> chains,
      {String currency = "CNY"}) async {
    state = const LoadingTask.loading();
    final allTokens = List<Erc20>.of([]);
    try {
      // 获取账户下，在指定区块链上所有的资产
      for (final chain in chains) {
        final tokens = await getBalances(address, chain);
        final validTokens =
            tokens.where((element) => element.symbol?.isNotEmpty ?? false);
        allTokens.addAll(validTokens);
      }
      // 如果没有资产，直接返回
      if (allTokens.isEmpty) {
        state = const LoadingTask.success([]);
        return;
      }

      /// 获取所有资产在各个区块链上的行情数据
      final symbolList = allTokens
          // .where((element) => element.hasBalance)
          .map((e) => e.symbol!)
          .toSet()
          .where((sym) => Validator.shared.isAlphanumeric(sym));
      final symbols = symbolList.join(",");
      final quotes =
          await CoinMarketCapApi.client.latestQuote(symbols, currency);
      final allTokensQuotes = quotes.data;

      /// 当 token 的行情数据为空时，表示CoinMarketCap没有收录该货币；
      // quotes.data!.removeWhere((key, value) => value.isEmpty);
      if (allTokensQuotes == null || allTokensQuotes.isEmpty) {
        state = LoadingTask.success(allTokens);
        return;
      }
      final finalTokens = List<Erc20>.of([]);

      /// 将行情数据和资产数据绑定
      for (final token in allTokens) {
        final tokenQuotes = allTokensQuotes[token.symbol] ?? [];
        if (tokenQuotes.isEmpty) {
          continue;
        }
        if (tokenQuotes.length == 1 && tokenQuotes.first.platform == null) {
          Log.i(
              "${token.symbol} ${token.chain?.name ?? "--"} ${token.tokenAddress} ${tokenQuotes.first.platform?.name ?? "--"} ${tokenQuotes.first.platform?.tokenAddress ?? "--"}");
          finalTokens.add(token.copyWith(
              quote: tokenQuotes.first.quote?[currency],
              quoteInfo: tokenQuotes.first));
          continue;
        }
        try {
          final tokenQuoteInfo = tokenQuotes.firstWhere(
            (currencyInfo) {
              // 如果是区块链官方货币，默认不会返回platform信息，直接返回即可；
              final mainChainNames =
                  chains.map((e) => e.marketCapPlatformName).toSet();
              if (mainChainNames.contains(currencyInfo.name)) {
                return true;
              }
              final capPlatName = token.chain!.marketCapPlatformName;
              final samePlatform = capPlatName == currencyInfo.platform?.name;
              final sameAddress =
                  token.tokenAddress == currencyInfo.platform?.tokenAddress;
              return samePlatform && sameAddress;
            },
          );
          final quote = tokenQuoteInfo.quote?[currency];
          finalTokens
              .add(token.copyWith(quote: quote, quoteInfo: tokenQuoteInfo));
          Log.i(
              "${token.symbol} ${token.chain?.name ?? "--"} ${token.tokenAddress} ${tokenQuoteInfo.platform?.name ?? "--"} ${tokenQuoteInfo.platform?.tokenAddress ?? "--"}");
        } catch (e) {
          finalTokens.add(token);
          Log.i(
              "${token.symbol} ${token.chain?.name ?? "--"} ${token.tokenAddress} --  --");
        }
      }
      finalTokens.sort((a, b) {
        final aPrice = a.quote?.price;
        final bPrice = b.quote?.price;
        if (aPrice != null && bPrice != null) return bPrice.compareTo(aPrice);
        if (bPrice != null && bPrice > 0) return 1;
        if (aPrice != null && aPrice > 0) return -1;
        return b.balance!.compareTo(a.balance!);
      });
      state = LoadingTask.success(finalTokens);
    } catch (e) {
      state = LoadingTask.error(e);
    }
  }
}
