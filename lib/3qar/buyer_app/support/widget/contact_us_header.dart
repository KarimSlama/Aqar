import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/aqar_string.dart';


class ContactUsHeader extends StatelessWidget {
  const ContactUsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 16),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: AqarColors.blue,
        borderRadius:
            BorderRadiusDirectional.vertical(bottom: Radius.circular(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AqarString.contactUs,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AqarColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          Text(
            AqarString
                .ifYouHaveAnyInquiresGetInTouchWithUsWeWillBeHappyToHelpYou,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AqarColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
