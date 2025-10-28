import 'package:aqar/3qar/buyer_app/home/data/model/filter_data.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';

class RoomsFilterSection extends StatefulWidget {
  final FilterData filterData;

  const RoomsFilterSection({
    super.key,
    required this.filterData,
  });

  @override
  State<RoomsFilterSection> createState() => _RoomsFilterSectionState();
}

class _RoomsFilterSectionState extends State<RoomsFilterSection> {
  int? selectedRooms;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(6, (index) {
        final number = index + 1;
        final isSelected = widget.filterData.numberOfRooms == number;
        return ChoiceChip(
          label: Text('$number'),
          selected: isSelected,
          selectedColor: AqarColors.primary.withValues(alpha: .2),
          onSelected: (selected) {
            setState(() {
              widget.filterData.numberOfRooms = selected ? number : null;
            });
          },
        );
      }),
    );
  }
}
