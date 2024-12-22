import 'package:flutter/material.dart';
import 'package:tech_task/modules/dash_board/dash_board_interfaces.dart';
import 'package:tech_task/modules/dash_board/entities/orders_data_model.dart';
import 'package:tech_task/modules/dash_board/view_model/dash_board_view_model.dart';

class DashBoardPresenter implements DashBoardPresenterInterface, DashBoardInteractorOutputInterface {
  final DashBoardInteractorInputInterface interactor;
  final DashBoardControllerInterface controller;
  final DashBoardRouterInterface router;
  late BuildContext _context;

  DashBoardPresenter(this.controller, this.interactor, this.router);

  @override
  void onWidgetBuilt(BuildContext context) {
    _context = context;
    interactor.getOrders();
  }

  @override
  void ordersFetched(List<OrdersDataModel> dataModel){
    controller.render(DashBoardViewModel(dataModel));
  }
}
