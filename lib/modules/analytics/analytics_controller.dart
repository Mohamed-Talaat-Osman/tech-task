import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_task/modules/analytics/analytics_interfaces.dart';
import 'package:tech_task/modules/analytics/view_model/analytics_view_model.dart';

class AnalyticsController implements AnalyticsControllerInterface {
  late AnalyticsPresenterInterface presenter;
  late BuildContext _context;

  final streamController =
  StreamController<AnalyticsViewModel>.broadcast();

  Stream<AnalyticsViewModel> get viewModelStream =>
      streamController.stream;

  void onWidgetBuilt(BuildContext context) {
    _context = context;
    presenter.onWidgetBuilt(_context);
  }

  @override
  void render(AnalyticsViewModel viewModel) {
    streamController.add(viewModel);
  }
}
