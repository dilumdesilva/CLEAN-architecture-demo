import 'package:clean_architecture_demo/data/data_source/mock_data_source.dart';
import 'package:clean_architecture_demo/data/data_source/todo_data_source.dart';
import 'package:clean_architecture_demo/data/network/network_info.dart';
import 'package:clean_architecture_demo/data/repository_impl/todo_repository_impl.dart';
import 'package:clean_architecture_demo/domain/repository/todo_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getItInstance = GetIt.instance;

Future<void> initAppModule() async {
  // network info instance
  getItInstance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // remote data source instance
  getItInstance
      .registerLazySingleton<TodoDataSource>(() => MockDataSourceImpl());

  // repository instance
  getItInstance.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(getItInstance(), getItInstance()));
}
