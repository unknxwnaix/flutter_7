import 'package:get_it/get_it.dart';
import 'package:auto/core/network/dio_client.dart';
import 'package:auto/features/home/data/data_source/home_remote_data.dart';
import 'package:auto/features/home/data/repository/home_repository_impl.dart';
import 'package:auto/features/home/domain/repository/home_repository.dart';
import 'package:auto/features/home/domain/use_case/home_use_case.dart';
import 'package:auto/features/home/presentation/state/home_controller.dart';

final service = GetIt.instance;

Future<void> init() async {
  const String apiKey = 'HtNLBpHLuWZqyDZLqV/RhA==NjDXl09hKf5Plejh';

  // Dio Client
  service.registerLazySingleton(() => DioClient(apiKey));

  // Data Sources
  service.registerLazySingleton<HomeRemoteData>(() => HomeRemoteDataImpl(service()));

  // Repository
  service.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(service()));

  // Use Cases
  service.registerLazySingleton(() => HomeUseCase(service()));

  // State Management
  service.registerFactory(() => HomeController(service()));
}
