import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomAppBarLeadingWidget extends StatelessWidget {
  const CustomAppBarLeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AqarColors.white,
          borderRadius: BorderRadiusDirectional.circular(20)),
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Iconsax.arrow_left,
          color: AqarColors.blue,
        ),
      ),
    );
  }
}
