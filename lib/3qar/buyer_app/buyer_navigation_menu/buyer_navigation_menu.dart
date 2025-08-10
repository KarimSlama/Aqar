import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/buyer_navigation_cubit.dart';
import 'controller/buyer_navigation_state.dart';
import 'widget/buyer_custom_bottom_nav.dart';

class BuyerNavigationMenu extends StatelessWidget {
  const BuyerNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final navCubit = context.read<BuyerNavigationCubit>();
    return Scaffold(
      body: Stack(
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
            child: BuyerCustomBottomNavBar(
              onTap: (index) {
                navCubit.changeNavigationScreen(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
