import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_bloc/di/injection.dart';
import 'package:learning_bloc/presentation/bloc/post_bloc.dart';
import 'package:learning_bloc/presentation/bloc/post_event.dart';
import 'package:learning_bloc/presentation/bloc/post_state.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: BlocProvider(
        create: (_) =>
            getIt<PostBloc>()..add(const GetPostsEvent(start: 0, limit: 100)),
        child: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
          if (state is InitialPostState) {
            return const Center(child: Text("Press to load"));
          } else if (state is LoadingPostState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedPostsState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title),
                    subtitle: Text(state.posts[index].body),
                  );
                });
          } else if (state is ErrorPostState) {
            return Center(
              child: Text(state.message),
            );
          }
          //fallback option
          return const Center(
            child: Text("Unknown state"),
          );
        }),
      ),
    );
  }
}
