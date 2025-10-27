import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_event.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/filter_data.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/area_filter_section.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/bathrooms_filter_section.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/filter_drawer_header.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/location_filter_section.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/price_filter_section.dart';
import 'package:aqar/3qar/buyer_app/home/widgets/filteration/rooms_filter_section.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../core/common/widgets/row/row_icon_with_title.dart';
import '../../controller/search/bloc/search_bloc.dart';
import 'property_type_filter_section.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  final FilterData filterData = FilterData();

  void _applyFilters() {
    context.read<SearchBloc>().add(
          SearchQueryChanged(
            minPrice: filterData.minPrice,
            maxPrice: filterData.maxPrice,
            minArea: filterData.minArea,
            maxArea: filterData.maxArea,
            numberOfRooms: filterData.numberOfRooms,
            numberOfBathrooms: filterData.numberOfBathrooms,
            location: filterData.location,
            saleType: filterData.saleType,
          ),
        );
    context.pop();
  }

  void _resetFilters() {
    setState(() {
      filterData.clear();
    });
    context.read<SearchBloc>().add(ResetSearchFilters());
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            FilterDrawerHeader(
              onApply: _applyFilters,
              onReset: _resetFilters,
            ),

            // Filters Content
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(12),
                child: Column(
                  spacing: 16.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Price Section

                    RowIconWithTitle(
                      icon: Icons.currency_bitcoin,
                      text: 'Price',
                    ),
                    PriceFilterSection(
                      filterData: filterData,
                      // key: priceKey,
                    ),

                    // Location Section

                    RowIconWithTitle(
                      icon: Iconsax.location,
                      text: 'Location',
                    ),
                    LocationFilterSection(filterData: filterData),

                    RowIconWithTitle(
                      icon: Iconsax.size,
                      text: 'Area (sqm)',
                    ),

                    AreaFilterSection(
                      filterData: filterData,
                      // key: areaKey,
                    ),

                    // Rooms Section
                    RowIconWithTitle(
                      icon: Iconsax.home,
                      text: 'NO. of Rooms',
                    ),

                    RoomsFilterSection(filterData: filterData),

                    // Bathrooms Section
                    RowIconWithTitle(
                      icon: Iconsax.tag,
                      text: 'NO. of Bathrooms',
                    ),

                    BathroomsFilterSection(
                      filterData: filterData,
                    ),

                    // Type Section
                    RowIconWithTitle(
                      icon: Iconsax.tag,
                      text: 'Property Type',
                    ),

                    PropertyTypeFilterSection(filterData: filterData),

                    SizedBox(height: 60.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
