import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/extensions/string_ext.dart';
import 'package:yc_wallet/repository/apis/moralis/models/erc20/erc20.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/token_amount_converter.dart';

class TokenCell extends ConsumerWidget {
  final Erc20 token;
  const TokenCell({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = weiToAmount(token.balance, token.decimals ?? 18, fixed: 4);
    final percent24 = token.quote?.percentChange24h;
    final isUp = (percent24 ?? 0.0) > 0;
    final percent24Display = keepDecimal(percent24, nullReplace: "");

    var price = token.quote?.price;
    if (price == 0) price = null;
    final priceDisplay = keepDecimal(price,
        fixed: 4, nullReplace: "$rmbMark 0.00", prefix: "$rmbMark ");
    final total = keepDecimal(token.total);

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xfff5f5f5),
        child: CachedNetworkImage(
          imageUrl: token.tokenImage,
          width: 36,
          height: 36,
          errorWidget: (context, url, _) => CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
      ),
      title: Text(token.symbol ?? "",
          style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Row(
        children: [
          Text(priceDisplay),
          const SizedBox(width: 8),
          if (percent24 != null)
            Text(
              "$percent24Display %",
              style: TextStyle(
                color: isUp ? Colors.red : Colors.green,
              ),
            ),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(amount),
          const SizedBox(height: 4),
          Text("$rmbMark $total"),
        ],
      ),
    );
  }
}
