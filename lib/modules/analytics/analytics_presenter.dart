import 'package:flutter/cupertino.dart';
import 'package:tech_task/modules/analytics/analytics_interfaces.dart';
import 'package:tech_task/modules/analytics/view_model/analytics_view_model.dart';
import 'entities/orders_data_model.dart';

class AnalyticsPresenter implements AnalyticsPresenterInterface, AnalyticsInteractorOutputInterface {
  final AnalyticsInteractorInputInterface interactor;
  final AnalyticsControllerInterface controller;
  final AnalyticsRouterInterface router;
  late BuildContext _context;

  AnalyticsPresenter(this.controller, this.interactor, this.router);

  @override
  void onWidgetBuilt(BuildContext context) {
    _context = context;
    interactor.getOrders();
  }

  @override
  void ordersFetched(List<OrdersDataModel> dataModel) {
    controller.render(AnalyticsViewModel(dataModel));
  }
}
