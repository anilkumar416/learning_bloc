sealed class PostEvent {
  const PostEvent();
}

class GetPostsEvent extends PostEvent {
  final int start;
  final int limit;

  const GetPostsEvent({required this.start, required this.limit});
}
