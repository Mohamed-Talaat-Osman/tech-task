import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tech_task/helpers/corner_radius/corner_radius.dart';
import 'package:tech_task/helpers/padding/padding.dart';
import 'package:tech_task/managers/theme/colors_manager.dart';
import 'package:tech_task/modules/dash_board/dash_board_controller.dart';

import '../../gen/assets.gen.dart';
import '../../widgets/detail_container/detail_container_widget.dart';
import 'entities/order_type_model.dart';

class DashBoardScreen extends StatefulWidget {
  final DashBoardController controller;

  const DashBoardScreen(this.controller, {super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        DetailContainerWidget(
                          title: 'total orders',
                          value: viewModel.totalOrders ?? '',
                        ),
                        SizedBox(
                          width: PaddingHorizontal.eight,
                        ),
                        DetailContainerWidget(
                          title: 'average price',
                          value: viewModel.averagePrice ?? '',
                        ),
                        SizedBox(
                          width: PaddingHorizontal.eight,
                        ),
                        DetailContainerWidget(
                          title: 'return orders',
                          value: viewModel.returnedCount ?? '',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: PaddingHorizontal.eight,
                        vertical: PaddingVertical.eight),
                    decoration: BoxDecoration(
                      color: ColorsManager.foundationMainWhite,
                      borderRadius: BorderRadius.circular(CornerRadius.eight),
                    ),
                    child: SfCircularChart(
                      legend: const Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      series: <CircularSeries>[
                        PieSeries<OrderTypeModel, String>(
                          dataSource: viewModel.getOrderData(),
                          xValueMapper: (OrderTypeModel data, _) => data.status,
                          yValueMapper: (OrderTypeModel data, _) => data.count,
                          dataLabelMapper: (OrderTypeModel data, _) =>
                              data.status,
                          explode: true,
                          explodeAll: true,
                          radius: '80%',
                        )
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 2,
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
