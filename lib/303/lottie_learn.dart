import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uikit/uikit.dart';

import '../product/constant/duration_items.dart';
import '../product/constant/lottie_items.dart';
import '../product/global/theme_notifier.dart';
import '../product/navigator/navigator_routes.dart';

class LottieLearn extends StatefulWidget {
  const LottieLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _LottieLearnState createState() => _LottieLearnState();
}

// https://assets1.lottiefiles.com/packages/lf20_ydo1amjm.json
class _LottieLearnState extends State<LottieLearn>
    with TickerProviderStateMixin {
  late AnimationController controller;
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: DurationItems.durationNormal(),
    );
    navigateToHome();
  }

  Future<void> navigateToHome() async {
    await Future.delayed(const Duration(seconds: 1));
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacementNamed(NavigateRoutes.home.withParaf);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            onTap: () async {
              isLight = !isLight;

              await controller.animateTo(isLight ? 0.5 : 1);
              // controller.animateTo(0.5);
              Future.microtask(() {
                context.read<ThemeNotifier>().changeTheme();
              });
            },
            child: Lottie.asset(
              LottieItems.themeChange.lottiePath,
              repeat: false,
              controller: controller,
            ),
          ),
        ],
      ),
      body: const LottieLoading(),
    );
  }
}
