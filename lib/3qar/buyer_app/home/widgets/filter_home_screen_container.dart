import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_bloc.dart';
import 'package:aqar/3qar/buyer_app/home/controller/search/bloc/search_event.dart';
import 'package:aqar/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import 'filter_menu_items.dart';
import 'flexible_text_form_field.dart';

class FilterHomeSearchContainer extends StatelessWidget {
  const FilterHomeSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Container(
      padding: EdgeInsetsDirectional.all(AqarSizes.xs),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AqarColors.grey, width: .6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AqarSizes.ms,
        children: [
          FlexibleTextFormField(
            onSearchChanged: (value) =>
                searchBloc.add(SearchQueryChanged(searchQuery: value)),
          ),
          Container(
            width: .5,
            height: AqarHelperFunctions.screenHeight(context) / 30,
            color: AqarColors.light,
          ),
          FilterMenuItems(),
          IconButton(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Icon(Iconsax.setting_4_copy))
        ],
      ),
    );
  }
}

