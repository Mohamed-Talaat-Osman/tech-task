import 'package:tech_task/modules/dash_board/dash_board_controller.dart';
import 'package:tech_task/modules/dash_board/dash_board_interactor.dart';
import 'package:tech_task/modules/dash_board/dash_board_interfaces.dart';
import 'package:tech_task/modules/dash_board/dash_board_presenter.dart';
import 'package:tech_task/modules/dash_board/dash_board_screen.dart';

class DashBoardRouter extends DashBoardRouterInterface {
  static DashBoardScreen initModule() {
    DashBoardInteractor interactor = DashBoardInteractor();
    DashBoardController controller = DashBoardController();
    DashBoardRouter router = DashBoardRouter();
    DashBoardPresenter presenter = DashBoardPresenter(controller, interactor, router);
    interactor.presenter = presenter;
    controller.presenter = presenter;
    return DashBoardScreen(controller);
  }
}
