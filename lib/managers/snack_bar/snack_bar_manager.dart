import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/padding/padding.dart';
import '../theme/colors_manager.dart';
import '../theme/textstyles_manager.dart';
import '../../helpers/corner_radius/corner_radius.dart';

class SnackBarManager {
  static SnackBarManager? _instance;

  SnackBarManager._internal();

  factory SnackBarManager() {
    _instance ??= SnackBarManager._internal();
    return _instance!;
  }

  static void showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorsManager.foundationMainPrimary,
      content: Row(
        children: [
          Assets.icons.icOutlinedCheck.svg(),
          SizedBox(
            width: PaddingHorizontal.eight,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStylesManager.p1
                  .copyWith(color: ColorsManager.foundationMainWhite),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CornerRadius.eight),
      ),
    ));
  }

  static void showErrorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: ColorsManager.coreAppContentPrimary,
      content: Row(
        children: [
          Assets.icons.icFilledInfo.svg(),
          SizedBox(
            width: PaddingHorizontal.eight,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStylesManager.p1
                  .copyWith(color: ColorsManager.foundationMainWhite),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(CornerRadius.eight),
      ),
    ));
  }
}
