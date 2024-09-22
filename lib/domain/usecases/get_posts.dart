import 'package:dartz/dartz.dart';
import 'package:learning_bloc/domain/entities/post.dart';
import 'package:learning_bloc/domain/repositories/post_repository.dart';

class GetPosts {
  final PostRepository postRepository;

  GetPosts(this.postRepository);

  Future<Either<Exception, List<Post>>> call(int start, int limit) {
    return postRepository.getPosts(start, limit);
  }
}
