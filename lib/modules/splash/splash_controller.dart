import 'package:flutter/cupertino.dart';
import 'package:tech_task/modules/splash/splash_interfaces.dart';

class SplashController implements SplashControllerInterface {
  late SplashPresenterInterface presenter;
  late BuildContext _context;

  void onWidgetBuilt(BuildContext context) {
    _context = context;
    presenter.onWidgetBuilt(_context);
  }
}
