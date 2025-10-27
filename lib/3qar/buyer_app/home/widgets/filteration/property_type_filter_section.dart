import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';

import '../../data/model/filter_data.dart';

class PropertyTypeFilterSection extends StatefulWidget {
  final FilterData filterData;

  const PropertyTypeFilterSection({
    super.key,
    required this.filterData,
  });

  @override
  State<PropertyTypeFilterSection> createState() =>
      _PropertyTypeFilterSectionState();
}

class _PropertyTypeFilterSectionState extends State<PropertyTypeFilterSection> {
  final List<String> types = ['For Sale', 'For Rent'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: types.map((type) {
        return RadioListTile<String>(
          title: Text(type),
          value: type,
          groupValue: widget.filterData.saleType,
          activeColor: AqarColors.primary,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            setState(() {
              widget.filterData.saleType = value;
            });
          },
        );
      }).toList(),
    );
  }
}
