import 'package:aqar/core/common/widgets/aqar_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/constants/aqar_colors.dart';
import '../../data/model/filter_data.dart';

class PriceFilterSection extends StatefulWidget {
  final FilterData filterData;

  const PriceFilterSection({
    super.key,
    required this.filterData,
  });

  @override
  State<PriceFilterSection> createState() => _PriceFilterSectionState();
}

class _PriceFilterSectionState extends State<PriceFilterSection> {
  final minPriceController = TextEditingController();
  final maxPriceController = TextEditingController();

  void clear() {
    minPriceController.clear();
    maxPriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: AqarTextFormField(
            inputType: TextInputType.number,
            controller: minPriceController,
            label: 'Min',
            prefixIcon: Iconsax.money,
            borderColor: AqarColors.light.withValues(alpha: .3),
            onChanged: (value) {
              widget.filterData.minPrice = double.tryParse(value);
            },
          ),
        ),
        Expanded(
          child: AqarTextFormField(
            inputType: TextInputType.number,
            label: 'Max',
            controller: maxPriceController,
            prefixIcon: Iconsax.money,
            borderColor: AqarColors.light.withValues(alpha: .3),
            onChanged: (value) {
              widget.filterData.maxPrice = double.tryParse(value);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    minPriceController.dispose();
    maxPriceController.dispose();
    super.dispose();
  }
}
