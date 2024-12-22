import 'package:tech_task/helpers/navigator/go_to.dart';
import 'package:tech_task/modules/splash/splash_controller.dart';
import 'package:tech_task/modules/splash/splash_interactor.dart';
import 'package:tech_task/modules/splash/splash_interfaces.dart';
import 'package:tech_task/modules/splash/splash_presenter.dart';
import 'package:tech_task/modules/splash/splash_screen.dart';
import 'package:tech_task/side_bar.dart';

class SplashRouter extends SplashRouterInterface {
  static SplashScreen initModule() {
    SplashInteractor interactor = SplashInteractor();
    SplashController controller = SplashController();
    SplashRouter router = SplashRouter();
    SplashPresenter presenter = SplashPresenter(controller, interactor, router);
    interactor.presenter = presenter;
    controller.presenter = presenter;
    return SplashScreen(controller);
  }

  @override
  void navigateToHome() {
    GoTo.screenAndRemoveUntil(const SideBarScreen());
  }
}
