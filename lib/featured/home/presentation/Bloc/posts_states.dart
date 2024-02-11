part of "posts_bloc.dart";

enum PostsStatus { loading, success, error }

class PostsState extends Equatable {
  final PostsStatus status;
  final List<Post> posts;
  final bool hasReachedMax;
  final String errMessage;

  const PostsState({
    this.status = PostsStatus.loading,
    this.posts= const[],
    this.hasReachedMax=false,
    this.errMessage="",
  });

  PostsState copyWith({
    PostsStatus?status,
    List<Post>?posts,
    bool?hasReachedMax,
    String?errMessage,
})
  {
    return PostsState(
      status:status??this.status,
      posts:posts??this.posts,
      hasReachedMax:hasReachedMax??this.hasReachedMax,
      errMessage:errMessage??this.errMessage,
    );
  }

  @override
  List<Object?> get props => [status, posts, hasReachedMax, errMessage];
}
