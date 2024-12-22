import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_task/helpers/corner_radius/corner_radius.dart';
import 'package:tech_task/helpers/padding/padding.dart';
import 'package:tech_task/helpers/responsive/responsive.dart';
import 'package:tech_task/managers/theme/colors_manager.dart';
import 'package:tech_task/managers/theme/textstyles_manager.dart';
import 'package:tech_task/modules/analytics/analytics_router.dart';
import 'package:tech_task/modules/dash_board/dash_board_router.dart';
import 'package:tech_task/widgets/button/button_widget.dart';
import 'package:tech_task/widgets/button/entities/button_widget_type.dart';

import 'gen/assets.gen.dart';

class SideBarScreen extends StatefulWidget {
  final int? index;

  const SideBarScreen({this.index, super.key});

  @override
  State<SideBarScreen> createState() => _SideBarScreenState();
}

class _SideBarScreenState extends State<SideBarScreen> {
  final List _widgets = [];
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _selectedIndex = widget.index ?? 0;
    _widgets.addAll([
      DashBoardRouter.initModule(),
      AnalyticsRouter.initModule(),
    ]);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Row(
        children: [
          if(Responsive.isDesktop(context))
            Container(
              width: 80.w,
              height: 896.h,
              color: ColorsManager.foundationMainWhite,
              padding: EdgeInsets.symmetric(
                vertical: PaddingVertical.sixteen,
                horizontal: PaddingHorizontal.eight,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: PaddingVertical.thirtyTwo),
                        child: Assets.icons.logoColored.svg(
                          height: 70.h,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: PaddingVertical.sixteen,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MENU',
                          style: TextStylesManager.caption2.copyWith(
                              color: ColorsManager.coreAppContentSecondary),
                        ),
                        SizedBox(
                          height: PaddingVertical.eight,
                        ),
                        // menu items
                        ButtonWidget(
                          title: 'dash board',
                          icon: Icons.data_saver_off_rounded,
                          type: _selectedIndex == 0
                              ? ButtonWidgetType.primary
                              : ButtonWidgetType.secondary,
                          onPressed: () {
                            _onItemTapped(0);
                          },
                        ),
                        SizedBox(
                          height: PaddingVertical.eight,
                        ),
                        ButtonWidget(
                          title: 'analytics',
                          icon: Icons.analytics_outlined,
                          type: _selectedIndex == 1
                              ? ButtonWidgetType.primary
                              : ButtonWidgetType.secondary,
                          onPressed: () {
                            _onItemTapped(1);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          Expanded(child: _widgets[_selectedIndex]),
        ],
      ),
      appBar: AppBar(),
      drawer: !Responsive.isDesktop(context) ? Drawer(
        shape: const BeveledRectangleBorder(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: PaddingVertical.sixteen,
            horizontal: PaddingHorizontal.eight,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: PaddingVertical.thirtyTwo),
                    child: Assets.icons.logoColored.svg(
                      height: 80.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: PaddingVertical.sixteen,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MENU',
                      style: TextStylesManager.caption2.copyWith(
                          color: ColorsManager.coreAppContentSecondary),
                    ),
                    SizedBox(
                      height: PaddingVertical.eight,
                    ),
                    // menu items
                    ButtonWidget(
                      title: 'dash board',
                      icon: Icons.data_saver_off_rounded,
                      type: _selectedIndex == 0
                          ? ButtonWidgetType.primary
                          : ButtonWidgetType.secondary,
                      onPressed: () {
                        _onItemTapped(0);
                        _scaffoldKey.currentState!.closeDrawer();
                      },
                    ),
                    SizedBox(
                      height: PaddingVertical.eight,
                    ),
                    ButtonWidget(
                      title: 'analytics',
                      icon: Icons.analytics_outlined,
                      type: _selectedIndex == 1
                          ? ButtonWidgetType.primary
                          : ButtonWidgetType.secondary,
                      onPressed: () {
                        _onItemTapped(1);
                        _scaffoldKey.currentState!.closeDrawer();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ) : null,
    );
  }
}
