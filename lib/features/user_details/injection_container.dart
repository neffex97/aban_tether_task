import 'package:aban_tether_task/features/user_details/data/datasource/user_details_remote_datasource.dart'
    show UserDetailsRemoteDataSource, UserDetailsRemoteDataSourceImpl;
import 'package:aban_tether_task/features/user_details/data/repositories/user_details_repository_impl.dart'
    show UserDetailsRepositoryImpl;
import 'package:aban_tether_task/features/user_details/domain/repositories/user_details_repository.dart'
    show UserDetailsRepository;
import 'package:aban_tether_task/features/user_details/domain/usecases/get_user_details_use_case.dart'
    show GetUserDetails;
import 'package:aban_tether_task/features/user_details/presentation/bloc/user_details_cubit.dart'
    show UserDetailsCubit;
import 'package:get_it/get_it.dart' show GetIt;

final sl = GetIt.instance;

void init() {
  // Data layer
  sl.registerLazySingleton<UserDetailsRemoteDataSource>(
    () => UserDetailsRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<UserDetailsRepository>(
    () => UserDetailsRepositoryImpl(sl()),
  );

  // Domain layer
  sl.registerLazySingleton(() => GetUserDetails(sl()));

  // Cubit
  sl.registerFactory(
    () => UserDetailsCubit(
      sl<UserDetailsRepository>(),
      getUserDetailsUseCase: sl<GetUserDetails>(),
    ),
  );
}
