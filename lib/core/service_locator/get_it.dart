import 'package:aqar/3qar/buyer_app/buyer_navigation_menu/controller/buyer_navigation_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/controller/home_cubit.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service.dart';
import 'package:aqar/3qar/buyer_app/home/data/network/property_service_impl.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/properties_repository.dart';
import 'package:aqar/3qar/buyer_app/home/data/repository/units_repository.dart';
import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:aqar/3qar/login/data/repository/login_repository.dart';
import 'package:aqar/3qar/sign_up/controller/cubit/sign_up_cubit.dart';
import 'package:aqar/3qar/sign_up/data/repository/sign_up_repository.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/register/register_service_impl.dart';
import 'package:get_it/get_it.dart';

import '../network/users/user_service.dart';
import '../network/users/user_service_impl.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  /// REGISTER SERVICE
  getIt.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());

  /// USER SERVICE
  getIt.registerLazySingleton<UserService>(() => UserServiceImpl());

  getIt.registerLazySingleton<PropertyService>(() => PropertyServiceImpl());

  /// LOGIN
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  /// SIGN UP
  getIt.registerLazySingleton<SignUpRepository>(
      () => SignUpRepository(getIt(), getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));

  /// BUYER NAVIGATION CUBIT
  getIt.registerFactory<BuyerNavigationCubit>(() => BuyerNavigationCubit());

  /// PROPERTY
  getIt.registerLazySingleton<PropertiesRepository>(
      () => PropertiesRepository(getIt()));
  getIt.registerLazySingleton<UnitsRepository>(() => UnitsRepository(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt(), getIt()));
}
