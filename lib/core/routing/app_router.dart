import 'package:aqar/3qar/buyer_app/buyer_navigation_menu/buyer_navigation_menu.dart';
import 'package:aqar/3qar/buyer_app/buyer_navigation_menu/controller/buyer_navigation_cubit.dart';
import 'package:aqar/3qar/buyer_app/conversation/conversation_screen.dart';
import 'package:aqar/3qar/buyer_app/conversation/cubit/message_cubit.dart';
import 'package:aqar/3qar/buyer_app/customer_service/cubit/customer_service_cubit.dart';
import 'package:aqar/3qar/buyer_app/customer_service/customer_service_screen.dart';
import 'package:aqar/3qar/buyer_app/favorite/controller.dart/cubit/favorites_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/data/model/property_details_model.dart';
import 'package:aqar/3qar/buyer_app/home/home_screen.dart';
import 'package:aqar/3qar/buyer_app/notifications/notifications_screen.dart';
import 'package:aqar/3qar/buyer_app/property_details/property_details_screen.dart';
import 'package:aqar/3qar/buyer_app/property_rating/controller/cubit/rating_cubit.dart';
import 'package:aqar/3qar/buyer_app/property_rating/property_rating_screen.dart';
import 'package:aqar/3qar/buyer_app/recommended_for_you_all_properties/recommended_for_you_all_properties_screen.dart';
import 'package:aqar/3qar/buyer_app/support/support_screen.dart';
import 'package:aqar/3qar/login_option/login_option_screen.dart';
import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/3qar/sign_up/data/model/user_model.dart';
import 'package:aqar/3qar/splash/splash_screen.dart';
import 'package:aqar/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../3qar/buyer_app/help_and_info/help_and_info_screen.dart';
import '../../3qar/buyer_app/home/controller/home/home_cubit.dart';
import '../../3qar/buyer_app/personal_information/personal_information_screen.dart';
import '../../3qar/buyer_app/profile/controller/profile/profile_cubit.dart';
import '../../3qar/buyer_app/profile_details/profile_details_screen.dart';
import '../../3qar/buyer_app/property_details/data/model/property_args.dart';
import '../../3qar/login/controller/login_cubit.dart';
import '../../3qar/login/login_screen.dart';
import '../../3qar/onboarding/onboarding_screen.dart';
import '../../3qar/sign_up/sign_up_screen.dart';
import '../service_locator/get_it.dart';

class MessageScreenArgs {
  final String userToId;
  final String userToName;
  final String userImage;

  const MessageScreenArgs(
      {required this.userToId,
      required this.userToName,
      required this.userImage});
}

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );

      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnboardingScreen(),
        );

      case Routes.loginOptionScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginOptionScreen(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );

      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: SignUpScreen(),
          ),
        );

      case Routes.buyerNavigationMenu:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<BuyerNavigationCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<HomeCubit>()
                  ..fetchProperties()
                  ..fetchUnits(),
              ),
              BlocProvider(create: (context) => getIt<FavoritesCubit>()),
            ],
            child: BuyerNavigationMenu(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      case Routes.propertyDetailsScreen:
        final property = settings.arguments as PropertyArgs;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<FavoritesCubit>(),
            child: PropertyDetailsScreen(args: property),
          ),
        );

      case Routes.propertyRatingScreen:
        final propertyId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RatingCubit>()
              ..fetchRatingsSummaryRelatedToPropertyId(propertyId),
            child: PropertyRatingScreen(propertyId: propertyId),
          ),
        );

      case Routes.recommendedForYouAllPropertiesScreen:
        final properties = settings.arguments as List<PropertyDetailsModel>;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<FavoritesCubit>(),
            child: RecommendedForYouAllPropertiesScreen(properties: properties),
          ),
        );

      case Routes.personalInformationScreen:
        final profile = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: getIt<ProfileCubit>(),
              ),
              BlocProvider.value(
                value: getIt<HomeCubit>(),
              ),
            ],
            child: PersonalInformationScreen(profile: profile),
          ),
        );

      case Routes.profileDetailsScreen:
        final profile = settings.arguments as UserModel;
        return MaterialPageRoute(
          builder: (_) => ProfileDetailsScreen(profile: profile),
        );

      case Routes.supportScreen:
        return MaterialPageRoute(
          builder: (_) => SupportScreen(),
        );
      case Routes.helpAndInfoScreen:
        return MaterialPageRoute(
          builder: (_) => HelpAndInfoScreen(),
        );

      case Routes.conversationScreen:
        final args = settings.arguments as MessageScreenArgs?;
        if (args == null) {
          return MaterialPageRoute(
              builder: (_) => const Text('Error: Missing conversation data'));
        }
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = getIt<MessageCubit>();
              cubit.getMessages(args.userToId);
              return cubit;
            },
            child: ConversationScreen(
              userToId: args.userToId,
              userToName: args.userToName,
              userImage: args.userImage,
            ),
          ),
        );

      case Routes.customerServiceScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<CustomerServiceCubit>(),
            child: CustomerServiceScreen(),
          ),
        );

      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => NotificationsScreen(),
        );

      default:
        return null;
    }
  }
}
