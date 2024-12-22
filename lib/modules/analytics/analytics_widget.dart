import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tech_task/managers/theme/textstyles_manager.dart';
import 'package:tech_task/modules/analytics/analytics_controller.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/corner_radius/corner_radius.dart';
import '../../helpers/padding/padding.dart';
import '../../managers/theme/colors_manager.dart';
import 'entities/order_type_model.dart';
import 'package:intl/intl.dart';


class AnalyticsWidget extends StatefulWidget {
  final AnalyticsController controller;

  const AnalyticsWidget(this.controller, {Key? key}) : super(key: key);

  @override
  State<AnalyticsWidget> createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.onWidgetBuilt(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.controller.viewModelStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final viewModel = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: PaddingHorizontal.sixteen,
                  vertical: PaddingVertical.sixteen),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingHorizontal.eight,
                        vertical: PaddingVertical.eight),
                    decoration: BoxDecoration(
                      color: ColorsManager.foundationMainWhite,
                      borderRadius: BorderRadius.circular(CornerRadius.eight),
                    ),
                    child: SfCartesianChart(
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      primaryXAxis: NumericAxis(
                        title: AxisTitle(
                            text: 'orders time',
                          textStyle: TextStylesManager.p3,
                        ),
                        interval : 1,
                        initialVisibleMinimum: 0.0,
                      ),
                      primaryYAxis: const NumericAxis(
                        title: AxisTitle(text: 'number of orders'),
                          interval :1,
                      ),
                      series: [
                        ColumnSeries<OrderTypeModel, int>(
                          dataSource: viewModel.chartData,
                          xValueMapper: (OrderTypeModel order, _) => int.parse(order.time),
                          yValueMapper: (OrderTypeModel order, _) =>
                              order.count,
                          color: Colors.blue,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox(
              height: 200.h,
              child: Assets.lottie.loader.lottie(),
            );
          }
        });
  }
}
