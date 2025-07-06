import 'package:aqar/3qar/login/controller/login_cubit.dart';
import 'package:aqar/3qar/login/data/repository/login_repository.dart';
import 'package:aqar/core/network/register/register_service.dart';
import 'package:aqar/core/network/register/register_service_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<RegisterService>(() => RegisterServiceImpl());
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepository(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
