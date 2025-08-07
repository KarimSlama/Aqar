import 'package:aqar/core/common/widgets/texts/title_with_subtitle_in_column.dart';
import 'package:aqar/core/constants/aqar_string.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/separators/heigth_separators.dart';

class PropertyPaymentPlans extends StatelessWidget {
  final double price, downPayment;
  final int installmentPeriodYears;

  const PropertyPaymentPlans({
    super.key,
    required this.price,
    required this.downPayment,
    required this.installmentPeriodYears,
  });

  @override
  Widget build(BuildContext context) {
    final monthlyInstallment = AqarHelperFunctions.calculateMonthlyInstallment(
        price, downPayment, installmentPeriodYears);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitleWithSuptitleInColumn(
          text: AqarString.installment,
          price: monthlyInstallment.toStringAsFixed(2),
          noOfYears: 8,
        ),
        HeightSeperator(),
        TitleWithSuptitleInColumn(
          text: AqarString.downPayment,
          price: '$downPayment',
        ),
      ],
    );
  }
}
