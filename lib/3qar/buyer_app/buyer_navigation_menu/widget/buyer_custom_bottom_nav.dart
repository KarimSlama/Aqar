import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../core/common/widgets/circulars/circular_container.dart';
import '../../../../core/common/widgets/circulars/circular_container_with_shadow.dart';
import '../../../../core/constants/aqar_colors.dart';
import '../../../../core/constants/aqar_sizes.dart';
import '../controller/buyer_navigation_cubit.dart';
import '../controller/buyer_navigation_state.dart';

class BuyerCustomBottomNavBar extends StatelessWidget {
  final Function(int index)? onTap;

  final List<IconData> icons = const [
    Iconsax.search_normal_1_copy,
    Iconsax.heart_copy,
    Iconsax.home_1_copy,
    Iconsax.message_2_copy,
    Iconsax.user_copy,
  ];

  const BuyerCustomBottomNavBar({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BuyerNavigationCubit, BuyerNavigationState, int>(
      selector: (state) => state is NavigationChanged ? state.index : 2,
      builder: (context, currentInex) {
        return Padding(
          padding: const EdgeInsets.all(AqarSizes.md),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AqarSizes.borderRadiusXxl),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: CircularContainer(
                padding: AqarSizes.ms,
                color: Colors.transparent,
                radius: AqarSizes.borderRadiusXl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(icons.length, (index) {
                    final isSelected = currentInex == index;
                    return GestureDetector(
                      onTap: () => onTap?.call(index),
                      child: Column(
                        spacing: isSelected ? 8 : 0,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircularContainerShadow(
                              containerColor: isSelected
                                  ? AqarColors.green
                                  : AqarColors.white,
                              widget: Icon(
                                icons[index],
                                color: isSelected
                                    ? AqarColors.white
                                    : AqarColors.black,
                              ),
                              padding: AqarSizes.md,
                              isSelected: isSelected),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
