import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/common/widgets/aqar_text_form_field.dart';
import '../../../../../core/constants/aqar_colors.dart';
import '../../data/model/filter_data.dart';

class AreaFilterSection extends StatefulWidget {
  final FilterData filterData;

  const AreaFilterSection({
    super.key,
    required this.filterData,
  });

  @override
  State<AreaFilterSection> createState() => _AreaFilterSectionState();
}

class _AreaFilterSectionState extends State<AreaFilterSection> {
  final minAreaController = TextEditingController();
  final maxAreaController = TextEditingController();

  void clear() {
    minAreaController.clear();
    maxAreaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Expanded(
          child: AqarTextFormField(
            inputType: TextInputType.number,
            controller: minAreaController,
            label: 'Min',
            prefixIcon: Iconsax.size_copy,
            borderColor: AqarColors.light.withValues(alpha: .3),
            onChanged: (value) {
              widget.filterData.minArea = int.tryParse(value);
            },
          ),
        ),
        Expanded(
          child: AqarTextFormField(
            inputType: TextInputType.number,
            label: 'Max',
            controller: maxAreaController,
            prefixIcon: Iconsax.size_copy,
            borderColor: AqarColors.light.withValues(alpha: .3),
            onChanged: (value) {
              widget.filterData.maxArea = int.tryParse(value);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    minAreaController.dispose();
    maxAreaController.dispose();
    super.dispose();
  }
}
