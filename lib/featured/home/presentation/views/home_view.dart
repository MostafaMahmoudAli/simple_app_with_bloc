import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_with_bloc/featured/home/presentation/views/widgets/loading_widget.dart';
import 'package:simple_app_with_bloc/featured/home/presentation/views/widgets/post_list_item_widget.dart';
import 'package:simple_app_with_bloc/featured/settings/presentation/views/settings_page.dart';

import '../Bloc/posts_bloc.dart';

class MyHomePage extends StatefulWidget {
     const MyHomePage({Key? key}) : super(key: key);
     @override
  State<MyHomePage> createState() => _MyHomePageState();

}
class _MyHomePageState extends State<MyHomePage> {
  final _scrollController=ScrollController();

  @override
  void initState() {

    _scrollController.addListener(()
    {
      return _onScroll();
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController..removeListener(()
    {
      _onScroll();

    })..dispose();

    super.dispose();
  }
  void _onScroll()
  {
    final currentScroll=_scrollController.offset;
    final maxScroll =_scrollController.position.maxScrollExtent;
    if(currentScroll >= (maxScroll*0.95))
    {
      BlocProvider.of<PostsBloc>(context).add(GetPostsEvent());
      // context.read<PostsBloc>().add(GetPostsEvent());
    }
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts Screen"),
        actions:
        [
          IconButton(
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)
                  {
                    return  const SettingsPage();
                  }
              ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocBuilder<PostsBloc,PostsState>(
            builder: (context, state)
            {
              switch(state.status)
              {
                case PostsStatus.loading:
                  return const LoadingWidget();
                case PostsStatus.success:
                return ListView.builder(
                  physics:const BouncingScrollPhysics(),
                  controller:_scrollController,
                    itemCount:state.hasReachedMax
                        ? state.posts.length
                        : state.posts.length+1,
                    itemBuilder:(context,index)
                    {
                      return index >= state.posts.length
                          ? const LoadingWidget()
                          : PostListItemWidget(post:state.posts[index]);
                    }
                );
                case PostsStatus.error:
                  return Center(child:Text(state.errMessage),);
              }
            }
          ),
    );
  }


}


