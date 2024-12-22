import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tech_task/modules/analytics/analytics_interfaces.dart';

import '../../managers/logger/logger_manager.dart';
import 'constants/analytics_endpoints.dart';
import 'entities/orders_data_model.dart';

class AnalyticsInteractor implements AnalyticsInteractorInputInterface {
  late AnalyticsInteractorOutputInterface presenter;

  @override
  void getOrders() async {
    try {
      List<OrdersDataModel> dataModel = [];
      final response =
      await rootBundle.loadString(AnalyticsEndpoints.orders.path);
      final data = await json.decode(response) as List;
      dataModel = data.map((item) => OrdersDataModel.fromJson(item)).toList();
      presenter.ordersFetched(dataModel);
    } catch (error, trace) {
      LoggerManager.instance.error(error);
      LoggerManager.instance.trace(trace);
    }
  }

}
