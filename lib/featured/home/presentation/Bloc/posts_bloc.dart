
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:simple_app_with_bloc/core/api_service.dart';

import '../../data/posts_model.dart';

part 'posts_states.dart';

part 'posts_events.dart';

class PostsBloc extends Bloc<PostsEvents, PostsState> {

  PostsBloc() : super(const PostsState())
  {
    on<PostsEvents>((event, emit) async
    {
     if(event is GetPostsEvent)
     {
       if(state.hasReachedMax==true){
         return;
       }
       try
       {
         if(state.status==PostsStatus.loading)
         {
           final posts =await APiService.fetchPosts();

           return emit(
               state.copyWith(
             status: PostsStatus.success,
             posts:posts,
             hasReachedMax:false,
           ));
         }else
         {
           final posts=await APiService.fetchPosts(state.posts.length);
           posts.isEmpty?
           emit(state.copyWith(hasReachedMax:true))
               :
           emit(state.copyWith(
             status:PostsStatus.success,
             posts:List.of(state.posts)..addAll(posts),
             hasReachedMax:false,
           ));
         }
       }catch(e)
       {
         emit(state.copyWith(
           status:PostsStatus.error,
           errMessage:"failed to fetch posts",
         ));
       }
     }
    },
    transformer: droppable(),
    );
  }
}
