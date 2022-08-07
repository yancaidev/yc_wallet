import 'dart:collection';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/navigation/yc_router_delegate.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_set_password.dart';
import 'package:yc_wallet/features/wallet/pages/create_wallet_page/create_wallet_verify_password.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/utils/scroll_behavior_none.dart';
import 'package:yc_wallet/widgets/dots_stepper.dart';
import 'create_wallet_generate_mnemonic.dart';
import 'create_wallet_tips.dart';
import 'create_wallet_verify_mnemonic.dart';

final _currentStepProvider = StateProvider((ref) => 0);

class CreateWalletPage extends BasePage {
  CreateWalletPage(RouteConfig config) : super(config, _CreateWalletRoot());

  @override
  bool onBackPressed() {
    return (child as _CreateWalletRoot).canGoBack();
  }
}

class _CreateWalletRoot extends StatelessWidget {
  final globalKey = GlobalKey<_CreateWalletStepsState>();

  _CreateWalletRoot({Key? key}) : super(key: key);

  bool canGoBack() {
    return globalKey.currentState?.previousPage() != false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("创建钱包", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: const YCBackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: _CreateWalletSteps(key: globalKey),
    );
  }
}

class _CreateWalletSteps extends ConsumerStatefulWidget {
  const _CreateWalletSteps({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _CreateWalletStepsState();
  }
}

class _CreateWalletStepsState extends ConsumerState<_CreateWalletSteps> {
  final PageController _pageController = PageController(keepPage: true);

  late final List<Widget> pages = List.of([]);
  int stepsCount = 5;

  @override
  void initState() {
    super.initState();
    pages.add(CreateWalletTips(generateMnemonic));
  }

  @override
  Widget build(BuildContext context) {
    final position = ref.watch(_currentStepProvider);
    Log.i("读取到的位置信息为 $position");
    // ref.listen<int>(_currentStepProvider, ((previous, next) {
    //   if (next == 0) {
    //     ref.refresh(shouldHideMnemonics);
    //     ref.refresh(mnemonicsProvider);
    //   }
    //   Log.i("页码状态变化了 $next");
    //   _pageController.animateToPage(next,
    //       duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    // }));

    return Column(
      children: [
        _CreateWalletStepper(stepsCount, position),
        Expanded(
            child: PageView(
          controller: _pageController,
          scrollBehavior: ScrollBehaviorNone(),
          physics: const NeverScrollableScrollPhysics(),
          children: pages.toList(),
          onPageChanged: (page) {
            Log.i("页面变化了 $page");
            // ref.read(_currentStepProvider.state).update((state) => page);
          },
        )),
      ],
    );
  }

  void nextPage({int step = 1}) {
    final page = ref.read(_currentStepProvider);
    ref.read(_currentStepProvider.state).update((state) => state + step);
    _pageController.animateToPage(page + step,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  bool previousPage({int step = 1}) {
    final page = ref.read(_currentStepProvider);
    if (page > 0) {
      ref.read(_currentStepProvider.state).update((state) => state - step);
      pages.removeLast();
      _pageController.animateToPage(page - step,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
      return false;
    }
    return true;
  }

  /// 跳转到创建助记词步骤
  void generateMnemonic() {
    pages.add(CreateWalletGenerateMnemonic(
        onSkipBackupMnemonicAtGenerateStep, onBackupMnemonic));
    nextPage();
  }

  /// 在创建助记词页面，跳过助记词备份步骤，跳转到设置密码步骤
  void onSkipBackupMnemonicAtGenerateStep() {
    stepsCount = 4;
    pages.add(CreateWalletSetPassword(onSetPassword));
    nextPage();
  }

  /// 在验证助记词页面，跳过备份助记词
  void skipMnemonicAtBackupStep() {
    Log.i("在验证助记词页面跳过了验证");
    pages.add(CreateWalletSetPassword(onSetPassword));
    nextPage();
  }

  /// 跳转到备份助记词页面
  void onBackupMnemonic() {
    Log.i("跳转到备份助记词页面");
    pages.add(CreateWalletVerifyMnemonic(
        skipMnemonicAtBackupStep, onMnemonicBackedup));
    nextPage();
  }

  /// 助记词创建成功，跳转到密码设置步骤；
  void onMnemonicBackedup() {
    Log.i("助记词验证成功，设置密码");
    pages.add(CreateWalletSetPassword(onSetPassword));
    nextPage();
  }

  /// 用户设置了密码，跳转到设置密码步骤；
  void onSetPassword() {
    pages.add(CreateWalletVerifyPassword(onPasswordVerified));
    nextPage();
  }

  /// 用户密码验证成功，跳转到主页；
  void onPasswordVerified() {
    Log.i("密码设置成功");
    YCRouterDetegate.of(context).clearAndPush(RouteConfig.main());
  }
}

class _CreateWalletStepper extends ConsumerWidget {
  final int steps;
  final int position;
  const _CreateWalletStepper(this.steps, this.position, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: DotsStepper(
        dotsCount: steps,
        position: position.toDouble(),
        decorator: const DotsDecorator(
            color: Colors.black26,
            shape: RoundedRectangleBorder(),
            activeShape: RoundedRectangleBorder(),
            size: Size(30, 2),
            activeSize: Size(30, 2),
            spacing: EdgeInsets.all(2)),
      ),
    );
  }
}

/// 记录下一步和上一步跨度
class StepsMark {
  int stepCount = 1;
}

/// 创建钱包步骤的父组件；
abstract class CreateWalletBaseStep extends ConsumerWidget {
  final int step;
  final StepsMark stepsMark = StepsMark();

  CreateWalletBaseStep(this.step, {Key? key}) : super(key: key);

  void nextStep(WidgetRef ref, {int step = 1}) {
    stepsMark.stepCount = step;
    ref.read(_currentStepProvider.state).update((state) => state += step);
  }

  void previousStep(WidgetRef ref) {
    if (ref.read(_currentStepProvider.state).state > 0) {
      ref.read(_currentStepProvider.state).state -= stepsMark.stepCount;
    }
  }
}
