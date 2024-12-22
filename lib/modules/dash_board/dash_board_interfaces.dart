import 'package:flutter/material.dart';
import 'package:tech_task/modules/dash_board/view_model/dash_board_view_model.dart';

import 'entities/orders_data_model.dart';

/// Controller => Presenter
abstract class DashBoardPresenterInterface {
  void onWidgetBuilt(BuildContext context);
}

/// Presenter => Interactor
abstract class DashBoardInteractorInputInterface {
  void getOrders();
}

/// Interactor => Presenter
abstract class DashBoardInteractorOutputInterface {
  void ordersFetched(List<OrdersDataModel> dataModel);
}

/// Presenter => Controller
abstract class DashBoardControllerInterface {
  void render(DashBoardViewModel viewModel);
}

/// Presenter => Router
abstract class DashBoardRouterInterface {}
