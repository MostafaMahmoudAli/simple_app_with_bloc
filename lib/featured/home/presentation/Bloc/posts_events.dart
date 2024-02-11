
part of"posts_bloc.dart";



abstract class PostsEvents extends Equatable
{
  const PostsEvents();

  @override
  List<Object?> get props => [];
}

class GetPostsEvent extends PostsEvents{}
