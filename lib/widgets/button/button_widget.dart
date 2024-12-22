import 'package:flutter/material.dart';
import 'package:tech_task/helpers/padding/padding.dart';
import 'package:tech_task/widgets/button/type/button_widget_type.dart';

import '../../managers/theme/textstyles_manager.dart';
import 'entities/button_widget_state.dart';
import 'entities/button_widget_type.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  final IconData? icon;
  late ButtonWidgetState _state;
  late ButtonWidgetType _type;
  late ButtonWidgetTypeInterface _theme;

  ButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      this.icon,
      ButtonWidgetState state = ButtonWidgetState.enabled,
      ButtonWidgetType type = ButtonWidgetType.primary}) {
    _state = state;
    _theme = type.theme(_state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.zero,
      onPressed: _state == ButtonWidgetState.enabled ? onPressed : () => {},
      child: Container(
        height: 40,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: PaddingHorizontal.four),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            color: _theme.backgroundColor,
            borderRadius: _theme.radius,
            border: _theme.border),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: _theme.textColor,
              ),
            if (icon != null)
              SizedBox(width:PaddingHorizontal.four ,),
              Text(
              title,
              style:
                  TextStylesManager.button2.copyWith(color: _theme.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
