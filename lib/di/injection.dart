import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:learning_bloc/data/datasources/post_remote_datasource.dart';
import 'package:learning_bloc/data/repositories/post_repository_impl.dart';
import 'package:learning_bloc/domain/repositories/post_repository.dart';
import 'package:learning_bloc/domain/usecases/get_posts.dart';
import 'package:learning_bloc/presentation/bloc/post_bloc.dart';

final getIt = GetIt.instance;

void init() {
  //external
  getIt.registerLazySingleton(() => Dio());

  //data sources
  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(getIt()));

  //repositories
  getIt
      .registerLazySingleton<PostRepository>(() => PostRepositoryImpl(getIt()));

  //use cases
  getIt.registerLazySingleton(() => GetPosts(getIt()));

  //bloc
  getIt.registerFactory(() => PostBloc(getIt()));
}
