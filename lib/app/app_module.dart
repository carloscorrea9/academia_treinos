import 'package:academia_treinos/app/auth_guard.dart';
import 'package:academia_treinos/core/network/dio_client.dart';
import 'package:academia_treinos/core/network/mock_database.dart';
import 'package:academia_treinos/core/network/mock_interceptor.dart';
import 'package:academia_treinos/core/storage/session_storage.dart';
import 'package:academia_treinos/modules/auth/data/datasources/auth_remote_datasource.dart';
import 'package:academia_treinos/modules/auth/data/repositories/auth_repository_impl.dart';
import 'package:academia_treinos/modules/auth/domain/repositories/auth_repository.dart';
import 'package:academia_treinos/modules/auth/presentation/pages/login_page.dart';
import 'package:academia_treinos/modules/auth/presentation/stores/login_store.dart';
import 'package:academia_treinos/modules/home/data/datasources/workout_remote_datasource.dart';
import 'package:academia_treinos/modules/home/data/repositories/workout_repository_impl.dart';
import 'package:academia_treinos/modules/home/domain/repositories/workout_repository.dart';
import 'package:academia_treinos/modules/home/domain/usecases/get_workout_by_day.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_bloc.dart';
import 'package:academia_treinos/modules/home/presentation/pages/home_page.dart';
import 'package:academia_treinos/modules/splash/splash_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance(GetStorage());
    i.addInstance(MockDatabase.instance);
    i.addLazySingleton<SessionStorage>(SessionStorage.new);
    i.addLazySingleton<MockInterceptor>(MockInterceptor.new);
    i.addLazySingleton<Dio>(
      () => DioClient.create(
        i.get<SessionStorage>(),
        i.get<MockInterceptor>(),
      ),
    );

    i.addLazySingleton<AuthRemoteDatasource>(AuthRemoteDatasource.new);
    i.addLazySingleton<AuthRepository>(AuthRepositoryImpl.new);
    i.addLazySingleton<LoginStore>(LoginStore.new);

    i.addLazySingleton<WorkoutRemoteDatasource>(WorkoutRemoteDatasource.new);
    i.addLazySingleton<WorkoutRepository>(WorkoutRepositoryImpl.new);
    i.addLazySingleton<GetWorkoutByDay>(GetWorkoutByDay.new);
    i.add<HomeBloc>(HomeBloc.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
    r.child('/login', child: (_) => const LoginPage());
    r.child('/home', child: (_) => const HomePage(), guards: [AuthGuard()]);
  }
}
