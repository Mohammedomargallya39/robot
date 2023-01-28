import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/presentation/controller/home_cubit.dart';
import '../../features/login/presentation/controller/login_cubit.dart';
import '../../features/register/presentation/controller/register_cubit.dart';
import '/core/network/local/cache_helper.dart';
import '/core/network/remote/dio_helper.dart';
import '/core/network/repository.dart';
import '/core/util/cubit/cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(
    () => AppBloc(),
  );

  sl.registerLazySingleton<LoginCubit>(() => LoginCubit());

  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit());

  sl.registerLazySingleton<HomeCubit>(() => HomeCubit());


  sl.registerLazySingleton<Repository>(
    () => RepoImplementation(
      dioHelper: sl(),
      cacheHelper: sl(),
    ),
  );


  // Core
  sl.registerLazySingleton<DioHelper>(
    () => DioImpl(),
  );

  sl.registerLazySingleton<CacheHelper>(
    () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
