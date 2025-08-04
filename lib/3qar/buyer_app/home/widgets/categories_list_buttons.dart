import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/aqar_sizes.dart';
import '../../../../gen/assets.gen.dart';
import 'categories_item_buttons.dart';

class CategoriesListButtons extends StatelessWidget {
  const CategoriesListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> buttonsText = [
      "Nearby",
      "For Sale",
      "For Rent",
    ];

    final List<Widget> buttonsIcon = [
      SvgPicture.asset(Assets.icons.nearby),
      SvgPicture.asset(Assets.icons.rent),
      SvgPicture.asset(Assets.icons.coupon),
    ];
    return SizedBox(
      height: 50,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => CategoriesItemButtons(
                /// MODIFY IT LATER
                isSelected: index == 0 ? true : false,
                icon: buttonsIcon[index],
                text: buttonsText[index],
              ),
          separatorBuilder: (_, __) => SizedBox(width: AqarSizes.ms),
          itemCount: 3),
    );
  }
}
