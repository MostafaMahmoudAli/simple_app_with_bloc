import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_app_with_bloc/featured/home/presentation/Bloc/posts_bloc.dart';
import 'package:simple_app_with_bloc/featured/settings/presentation/bloc/theme_bloc.dart';

import 'bloc_observer.dart';
import 'featured/home/presentation/views/home_view.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context,_)
      {
        return MultiBlocProvider(providers: [
            BlocProvider<PostsBloc>(
            create:(context)=>PostsBloc()..add(GetPostsEvent()),
            ),
          BlocProvider<ThemeBloc>(create: (context)=>ThemeBloc()..add(GetCurrentThemeEvent())),
        ],
          child: BlocBuilder<ThemeBloc,ThemeStates>(
            builder:(context,state)
            {
             if(state is LoadedThemeState)
             {
               return MaterialApp(
                 debugShowCheckedModeBanner:false,
                 theme:state.themeData,
                 home: const MyHomePage(),
               );
             }
             return Container();
            },
          ),
        );
      },
    );

  }
}


