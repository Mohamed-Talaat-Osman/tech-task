import 'package:tech_task/modules/analytics/analytics_controller.dart';
import 'package:tech_task/modules/analytics/analytics_interactor.dart';
import 'package:tech_task/modules/analytics/analytics_interfaces.dart';
import 'package:tech_task/modules/analytics/analytics_presenter.dart';
import 'package:tech_task/modules/analytics/analytics_widget.dart';

class AnalyticsRouter extends AnalyticsRouterInterface {
  static AnalyticsWidget initModule() {
    AnalyticsInteractor interactor = AnalyticsInteractor();
    AnalyticsController controller = AnalyticsController();
    AnalyticsRouter router = AnalyticsRouter();
    AnalyticsPresenter presenter = AnalyticsPresenter(controller, interactor, router);
    interactor.presenter = presenter;
    controller.presenter = presenter;
    return AnalyticsWidget(controller);
  }
}
