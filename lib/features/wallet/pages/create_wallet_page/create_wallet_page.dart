import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/features/navigation/route_config.dart';
import 'package:yc_wallet/features/wallet/pages/base_page.dart';
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
    return globalKey.currentState?.onBackPressed() != false;
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

  bool onBackPressed() {
    if (ref.read(_currentStepProvider.state).state > 0) {
      ref.read(_currentStepProvider.state).state -= 1;
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(_currentStepProvider, ((previous, next) {
      if (next == 0) {
        ref.refresh(shouldHideMnemonics);
        ref.refresh(mnemonicsProvider);
      }
      Log.i("页码变化了 $next");
      _pageController.animateToPage(next,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }));

    return Column(
      children: [
        const _CreateWalletStepper(),
        Expanded(
            child: PageView(
          controller: _pageController,
          scrollBehavior: ScrollBehaviorNone(),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CreateWalletTips(),
            CreateWalletGenerateMnemonic(),
            CreateWalletVerifyMnemonic(),
          ],
          onPageChanged: (page) {
            ref.read(_currentStepProvider.state).update((state) => page);
          },
        )),
      ],
    );
  }
}

class _CreateWalletStepper extends ConsumerWidget {
  const _CreateWalletStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final position = ref.watch(_currentStepProvider);
    return Center(
      child: DotsStepper(
        dotsCount: 3,
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

abstract class CreateWalletBaseStep extends ConsumerWidget {
  final int step;

  const CreateWalletBaseStep(this.step, {Key? key}) : super(key: key);

  void nextStep(WidgetRef ref) {
    ref.read(_currentStepProvider.state).state += 1;
  }

  void previousStep(WidgetRef ref) {
    if (ref.read(_currentStepProvider.state).state > 0) {
      ref.read(_currentStepProvider.state).state -= 1;
    }
  }
}
