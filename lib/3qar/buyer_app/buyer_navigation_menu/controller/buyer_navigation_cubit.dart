import 'package:aqar/3qar/buyer_app/chat/chat_screen.dart';
import 'package:aqar/3qar/buyer_app/chat/cubit/chat_list_cubit.dart';
import 'package:aqar/3qar/buyer_app/favorite/favorite_screen.dart';
import 'package:aqar/3qar/buyer_app/home/home_screen.dart';
import 'package:aqar/3qar/buyer_app/profile/profile_screen.dart';
import 'package:aqar/3qar/buyer_app/search/search_screen.dart';
import 'package:aqar/core/service_locator/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buyer_navigation_state.dart';

class BuyerNavigationCubit extends Cubit<BuyerNavigationState> {
  BuyerNavigationCubit() : super(BuyerNavigationState.initial());

  int currentIndex = 2;

  final List<Widget> _screens = [
    const SearchScreen(),
    const FavoriteScreen(),
    const HomeScreen(),
    BlocProvider(
      create: (context) => getIt<ChatListCubit>()..fetchChatUsers(),
      child: const ChatScreen(),
    ),
    const ProfileScreen(),
  ];

  List<Widget> get screens => _screens;

  void changeNavigationScreen(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(BuyerNavigationState.navigationChanged(currentIndex));
    }
  }
}
