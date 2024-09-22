import 'package:dio/dio.dart';
import 'package:learning_bloc/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts(int start, int limit);
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PostModel>> getPosts(int start, int limit) async {
    final response = await dio
        .get('https://jsonplaceholder.typicode.com/posts', queryParameters: {
      '_start': start,
      '_limit': limit,
    });

    if (response.statusCode == 200) {
      return (response.data as List)
          .map((json) => PostModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
