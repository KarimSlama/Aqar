import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../3qar/buyer_app/buyer_navigation_menu/controller/buyer_navigation_cubit.dart';
import '../../../../3qar/buyer_app/buyer_navigation_menu/widget/buyer_custom_bottom_nav.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final bool showAppBar;
  final VoidCallback? onPressed;

  const MainLayout({
    super.key,
    required this.child,
    this.showAppBar = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        body: child,
        bottomNavigationBar: BuyerCustomBottomNavBar(
            onTap: (index) => context
                .read<BuyerNavigationCubit>()
                .changeNavigationScreen(index)));
  }
}
