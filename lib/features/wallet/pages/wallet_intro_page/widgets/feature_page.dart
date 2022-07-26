import 'package:yc_wallet/share/quick_import.dart';

class FeaturePage extends StatelessWidget {
  final int _featureIndex;

  const FeaturePage(this._featureIndex, {Key? key}) : super(key: key);

  Widget get _feature {
    switch (_featureIndex) {
      case 0:
        return const _AssetsFeatture();
      case 1:
        return const _SecureFeatture();
      default:
        return const _TradeFeature();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: _feature,
    );
  }
}

class _AssetsFeatture extends StatelessWidget {
  const _AssetsFeatture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/nft.webp"),
        const SizedBox(
          height: 10,
        ),
        Text(
          "发现优质资产",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Text("尽在XXX", style: Theme.of(context).textTheme.titleLarge)
      ],
    );
  }
}

class _SecureFeatture extends StatelessWidget {
  const _SecureFeatture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/nft.webp"),
        const SizedBox(
          height: 10,
        ),
        Text(
          "安全使用  放心支付",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}

class _TradeFeature extends StatelessWidget {
  const _TradeFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/nft.webp"),
        const SizedBox(
          height: 10,
        ),
        Text(
          "便捷交易 极速跨链",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    );
  }
}
