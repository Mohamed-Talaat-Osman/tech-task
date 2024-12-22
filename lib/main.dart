import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'helpers/navigator/go_to.dart';
import 'managers/theme/app_theme_manager.dart';
import 'modules/splash/splash_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: GoTo.navigationKey,
        theme: appThemeManager(),
        home: SplashRouter.initModule(),
      ),
    );
  }
}
