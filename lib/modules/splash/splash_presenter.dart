import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tech_task/modules/splash/splash_interfaces.dart';

class SplashPresenter
    implements SplashPresenterInterface, SplashInteractorOutputInterface {
  final SplashInteractorInputInterface interactor;
  final SplashControllerInterface controller;
  final SplashRouterInterface router;
  late BuildContext _context;

  SplashPresenter(this.controller, this.interactor, this.router);

  @override
  void onWidgetBuilt(BuildContext context) {
    _context = context;
    Timer(const Duration(seconds: 2), (){
      router.navigateToHome();
    });
  }
}
