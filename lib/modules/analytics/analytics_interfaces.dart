import 'package:flutter/material.dart';
import 'package:tech_task/modules/analytics/view_model/analytics_view_model.dart';

import 'entities/orders_data_model.dart';

/// Controller => Presenter
abstract class AnalyticsPresenterInterface {
  void onWidgetBuilt(BuildContext context);
}

/// Presenter => Interactor
abstract class AnalyticsInteractorInputInterface {
  void getOrders();
}

/// Interactor => Presenter
abstract class AnalyticsInteractorOutputInterface {
  void ordersFetched(List<OrdersDataModel> dataModel);
}

/// Presenter => Controller
abstract class AnalyticsControllerInterface {
  void render(AnalyticsViewModel viewModel);
}

/// Presenter => Router
abstract class AnalyticsRouterInterface {}
