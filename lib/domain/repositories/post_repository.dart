import 'package:dartz/dartz.dart';
import 'package:learning_bloc/domain/entities/post.dart';

abstract class PostRepository {
  Future<Either<Exception, List<Post>>> getPosts(int start, int limit);
}
