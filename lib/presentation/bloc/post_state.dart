import 'package:learning_bloc/domain/entities/post.dart';

sealed class PostState {
  const PostState();
}

//initial state
class InitialPostState extends PostState {
  const InitialPostState();
}

//loading state
class LoadingPostState extends PostState {
  const LoadingPostState();
}

//Loaded state
class LoadedPostsState extends PostState {
  final List<Post> posts;

  const LoadedPostsState({required this.posts});
}

//Error state
class ErrorPostState extends PostState {
  final String message;
  const ErrorPostState({required this.message});
}
