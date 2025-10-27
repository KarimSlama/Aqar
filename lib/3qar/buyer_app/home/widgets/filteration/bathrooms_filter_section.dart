import 'package:aqar/3qar/buyer_app/home/data/model/filter_data.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';

class BathroomsFilterSection extends StatefulWidget {
  final FilterData filterData;
 const BathroomsFilterSection({super.key, required this.filterData});

  @override
  State<BathroomsFilterSection> createState() => _BathroomsFilterSectionState();
}

class _BathroomsFilterSectionState extends State<BathroomsFilterSection> {
  int? selectedBathrooms;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(5, (index) {
        final number = index + 1;
        final isSelected = widget.filterData.numberOfBathrooms == number;
        return ChoiceChip(
          label: Text('$number'),
          selected: isSelected,
          selectedColor: AqarColors.primary.withValues(alpha: .2),
          onSelected: (selected) {
            setState(() {
              widget.filterData.numberOfBathrooms = selected ? number : null;
            });
          },
        );
      }),
    );
  }
}
