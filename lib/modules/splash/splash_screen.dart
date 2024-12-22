import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/helpers/corner_radius/corner_radius.dart';
import 'package:tech_task/helpers/padding/padding.dart';
import 'package:tech_task/modules/splash/splash_controller.dart';

import '../../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  final SplashController controller;

  const SplashScreen(this.controller, {super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.onWidgetBuilt(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 140.h,
            child: Assets.icons.logoColored.svg()),
        SizedBox(
            height: 200.h,
            child: Assets.lottie.loader.lottie()),
      ],
    );
  }
}
