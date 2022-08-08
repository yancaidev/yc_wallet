import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/widgets/dots_indicator.dart';
import 'package:yc_wallet/widgets/number_pad.dart';

class PasswordPad extends ConsumerStatefulWidget {
  final int passwordLength;
  final void Function()? onClose;
  final void Function(String password)? onChange;
  final void Function(String password)? onDone;

  const PasswordPad({
    Key? key,
    this.passwordLength = 6,
    this.onClose,
    this.onChange,
    this.onDone,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordPadState();
}

class _PasswordPadState extends ConsumerState<PasswordPad> {
  late List<int> _password;
  late List<int> _keyboardKeys;

  @override
  void initState() {
    super.initState();
    _password = List.of([]);
    final numbers = List<int>.generate(10, (index) => index);
    numbers.sort(
        ((a, b) => Random().nextInt(1000) > Random().nextInt(1000) ? 1 : -1));
    _keyboardKeys = numbers;
  }

  List<int> get filledDots =>
      List<int>.generate(_password.length, (index) => index);

  void _notifyPasswordChange() {
    final pwd = _password.join("");
    if (widget.onChange != null) {
      widget.onChange!(pwd);
    }
    if (_password.length == widget.passwordLength && widget.onDone != null) {
      widget.onDone!(pwd);
    }
  }

  void _onNumer(int number) {
    if (_password.length == widget.passwordLength) return;
    setState(() {
      _password.add(number);
    });
    _notifyPasswordChange();
  }

  void _onDelete() {
    if (_password.isNotEmpty) {
      setState(() {
        _password.removeLast();
      });
    }
    _notifyPasswordChange();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Container()),
        _PasswordPadContainer(
          child: Column(
            children: [
              _ToolBar(onClose: widget.onClose),
              DotsIndicator(widget.passwordLength, filledDots),
              const SizedBox(height: 20),
              NumberPad(
                keys: _keyboardKeys,
                onNumberKeyPressed: _onNumer,
                onDelete: _onDelete,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _PasswordPadContainer extends StatelessWidget {
  final Widget? child;

  const _PasswordPadContainer({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: child,
    );
  }
}

class _ToolBar extends StatelessWidget {
  final void Function()? onClose;
  final Widget? leftButton;
  final Widget? rightButton;

  const _ToolBar({Key? key, this.onClose, this.leftButton, this.rightButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          height: 74,
          child: IconButton(
            onPressed: onClose,
            icon: leftButton ?? const Icon(Icons.close_sharp),
          ),
        ),
        const Text(
          "请输入钱包密码",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          width: 80,
          child: rightButton,
        ),
      ],
    );
  }
}
