import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../data/model/filter_data.dart';

class LocationFilterSection extends StatefulWidget {
  final FilterData filterData;

  const LocationFilterSection({
    super.key,
    required this.filterData,
  });

  @override
  State<LocationFilterSection> createState() => _LocationFilterSectionState();
}

class _LocationFilterSectionState extends State<LocationFilterSection> {
  String? selectedLocation;

  /// TODO: Replace with dynamic data and the best LOCATIONS

  final List<String> popularLocations = [
    'Maadi',
    'Dubai',
    'New Cairo',
    'Downtown',
    'Nasr City',
    'Abu Dhabi',
    'Sharjah',
    'Jumeirah',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      decoration: BoxDecoration(
        border: Border.all(color: AqarColors.light.withValues(alpha: .3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.builder(
        itemCount: popularLocations.length,
        itemBuilder: (context, index) {
          final location = popularLocations[index];
          final isSelected = widget.filterData.location == location;
          return ListTile(
            dense: true,
            leading: Icon(
              Iconsax.location,
              size: 20,
              color: isSelected ? AqarColors.primary : null,
            ),
            title: Text(
              location,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? AqarColors.primary : null,
              ),
            ),
            trailing: isSelected
                ? Icon(Icons.check, color: AqarColors.primary)
                : null,
            onTap: () {
              setState(() {
                widget.filterData.location = isSelected ? null : location;
              });
            },
          );
        },
      ),
    );
  }
}
