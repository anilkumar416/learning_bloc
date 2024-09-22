import 'package:dartz/dartz.dart';
import 'package:learning_bloc/data/datasources/post_remote_datasource.dart';
import 'package:learning_bloc/domain/entities/post.dart';
import 'package:learning_bloc/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Exception, List<Post>>> getPosts(int start, int limit) async {
    try {
      final postModels = await remoteDataSource.getPosts(start, limit);
      final posts =
          postModels.map((postModel) => postModel.toEntity()).toList();
      return Right(posts);
    } catch (e) {
      return Left(
        Exception('Failed to load posts'),
      );
    }
  }
}
