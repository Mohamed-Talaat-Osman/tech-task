import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_task/modules/dash_board/dash_board_interfaces.dart';
import 'package:tech_task/modules/dash_board/view_model/dash_board_view_model.dart';

class DashBoardController implements DashBoardControllerInterface {
  late DashBoardPresenterInterface presenter;
  late BuildContext _context;

  final streamController =
  StreamController<DashBoardViewModel>.broadcast();

  Stream<DashBoardViewModel> get viewModelStream =>
      streamController.stream;

  void onWidgetBuilt(BuildContext context) {
    _context = context;
    presenter.onWidgetBuilt(_context);
  }

  @override
  void render(DashBoardViewModel viewModel) {
    streamController.add(viewModel);
  }
}
