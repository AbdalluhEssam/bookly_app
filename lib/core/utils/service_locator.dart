import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/home/data/data_sources/home_local_data_source.dart';
import '../../features/home/data/data_sources/home_remote_data_source.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register a single instance of ApiService
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  // Use the same instance of ApiService for HomeRemoteDataSourceImpl
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(apiService: getIt<ApiService>()),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );
}
