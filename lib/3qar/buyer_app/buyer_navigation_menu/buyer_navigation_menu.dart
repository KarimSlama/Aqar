import 'dart:ui';

import 'package:aqar/core/common/widgets/circulars/circular_container.dart';
import 'package:aqar/core/common/widgets/circulars/circular_container_with_shadow.dart';
import 'package:aqar/core/constants/aqar_colors.dart';
import 'package:aqar/core/constants/aqar_sizes.dart';
import 'package:aqar/core/helpers/extensions.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'controller/buyer_navigation_cubit.dart';
import 'controller/buyer_navigation_state.dart';
import 'widget/buyer_custom_bottom_nav.dart';

class BuyerNavigationMenu extends StatelessWidget {
  const BuyerNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<BuyerNavigationCubit>();
    return Stack(
      children: [
        Positioned.fill(
          child: BlocBuilder<BuyerNavigationCubit, BuyerNavigationState>(
            builder: (context, state) {
              return navCubit.screens[navCubit.currentIndex];
            },
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 24,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AqarSizes.borderRadiusXxl),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: CircularContainer(
                    padding: AqarSizes.ms,
                    color: Colors.transparent,
                    radius: AqarSizes.borderRadiusXl,
                    child: GestureDetector(
                      onTap: () =>
                          context.pushNamed(Routes.customerServiceScreen),
                      child: CircularContainerShadow(
                        containerColor: AqarColors.green,
                        widget: Icon(Iconsax.headphone_copy,
                            color: AqarColors.white),
                        padding: AqarSizes.md,
                      ),
                    ),
                  ),
                ),
              ),
              BuyerCustomBottomNavBar(
                onTap: (index) {
                  navCubit.changeNavigationScreen(index);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
