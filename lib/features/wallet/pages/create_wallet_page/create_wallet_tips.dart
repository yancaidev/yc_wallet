import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_page.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/buttons.dart';
import 'package:yc_wallet/widgets/text_page_title.dart';

final _tipsAccepted = StateProvider<bool>((ref) => false);

class CreateWalletTips extends CreateWalletBaseStep {
  final void Function() onClickCreateWalletButton;

  CreateWalletTips(this.onClickCreateWalletButton, {Key? key})
      : super(0, key: key) {
    Log.i("tips 初始化");
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Log.i("Tips 構建");

    return Container(
      key: const ValueKey("tips--"),
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const TextPageTitle("创建助记词"),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text("建议手写抄录"),
              SizedBox(width: 20),
              Text("请勿复制保存"),
              SizedBox(width: 20),
              Text("请勿截图保存")
            ],
          ),
          const SizedBox(height: 10),
          const _Tips("助记词相当于你的钱包密码", Icons.home, "获取助记词等于获取资产所有权，一旦泄露资产将不再安全"),
          const _Tips("请手写抄录助记词", Icons.home, "若复制或截屏保存，助记词有可能泄露"),
          const _Tips("将助记词放在安全的地方", Icons.home, "一旦丢失资产将无法找回"),
          Expanded(child: Container()),
          _ActionArea(onClickCreateWalletButton),
        ],
      ),
    );
  }
}

class _ActionArea extends ConsumerStatefulWidget {
  final void Function() onClickCreateButton;

  _ActionArea(this.onClickCreateButton, {Key? key}) : super(key: key) {
    Log.i("action-area 初始化");
  }

  @override
  ConsumerState<_ActionArea> createState() => _ActionAreaState();
}

class _ActionAreaState extends ConsumerState<_ActionArea> {
  void _onCheckedChanged(bool? checked) {
    ref.read(_tipsAccepted.state).state = checked ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final isChecked = ref.watch(_tipsAccepted);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: _onCheckedChanged,
              activeColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1000)),
            ),
            const Expanded(child: Text("我了解助记词由我个人保管，一旦丢失 xxx 无法为我找回")),
          ],
        ),
        const SizedBox(height: 10),
        elevatedButton("创建",
            onPressed: isChecked ? widget.onClickCreateButton : null),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Tips extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String content;

  const _Tips(this.title, this.iconData, this.content, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                  textAlign: TextAlign.start,
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                  textAlign: TextAlign.start,
                  content,
                  style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }
}
