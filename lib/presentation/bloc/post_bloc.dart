import 'dart:async';

import 'package:learning_bloc/domain/usecases/get_posts.dart';
import 'package:learning_bloc/presentation/bloc/post_event.dart';
import 'package:learning_bloc/presentation/bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;

  PostBloc(this.getPosts) : super(const InitialPostState()) {
    on<GetPostsEvent>(_onGetPosts);
  }

  Future<void> _onGetPosts(GetPostsEvent event, Emitter<PostState> emit) async {
    emit(const LoadingPostState());
    final result = await getPosts(event.start, event.limit);

    result.fold(
      (error) => emit(ErrorPostState(message: error.toString())),
      (posts) => emit(LoadedPostsState(posts: posts)),
    );
  }
}
