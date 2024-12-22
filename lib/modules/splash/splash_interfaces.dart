import 'package:flutter/material.dart';

/// Controller => Presenter
abstract class SplashPresenterInterface {
  void onWidgetBuilt(BuildContext context);
}

/// Presenter => Interactor
abstract class SplashInteractorInputInterface {}

/// Interactor => Presenter
abstract class SplashInteractorOutputInterface {}

/// Presenter => Controller
abstract class SplashControllerInterface {}

/// Presenter => Router
abstract class SplashRouterInterface {
  void navigateToHome();
}
