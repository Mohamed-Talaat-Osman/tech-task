import 'package:flutter/material.dart';

import '../../helpers/corner_radius/corner_radius.dart';
import '../../helpers/padding/padding.dart';
import '../../managers/theme/colors_manager.dart';
import '../../managers/theme/textstyles_manager.dart';

class DetailContainerWidget extends StatelessWidget {
  final String title;
  final String value;
  const DetailContainerWidget({
     required this.title,
     required this.value,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: PaddingHorizontal.eight,
            vertical: PaddingVertical.eight),
        decoration: BoxDecoration(
          color: ColorsManager.foundationMainWhite,
          borderRadius: BorderRadius.circular(CornerRadius.eight),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStylesManager.p1,
            ),
            SizedBox(
              height: PaddingVertical.four,
            ),
            Text(
              title,
              style: TextStylesManager.p3
                  .copyWith(color: ColorsManager.coreAppContentSecondary),
            ),
          ],
        ),
      ),
    )
    ;
  }
}
