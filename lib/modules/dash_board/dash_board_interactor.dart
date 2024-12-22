import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tech_task/managers/logger/logger_manager.dart';
import 'package:tech_task/modules/dash_board/dash_board_interfaces.dart';
import 'package:tech_task/modules/dash_board/entities/orders_data_model.dart';

import 'constants/dash_board_endpoints.dart';

class DashBoardInteractor implements DashBoardInteractorInputInterface {
  late DashBoardInteractorOutputInterface presenter;

  @override
  void getOrders() async {
    try {
      List<OrdersDataModel> dataModel = [];
      final response =
          await rootBundle.loadString(DashBoardEndpoints.orders.path);
      final data = await json.decode(response) as List;
      dataModel = data.map((item) => OrdersDataModel.fromJson(item)).toList();
      presenter.ordersFetched(dataModel);
    } catch (error, trace) {
      LoggerManager.instance.error(error);
      LoggerManager.instance.trace(trace);
    }
  }
}
