import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_with_bloc/core/themes.dart';
import 'package:simple_app_with_bloc/featured/settings/presentation/bloc/theme_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      title:const Text("settings"),
      ),
      body:ListView.builder(
        itemCount:AppTheme.values.length,
          itemBuilder:(context,index)
          {
             final itemAppTheme =AppTheme.values[index];
            return Card(
              color:appThemeData[itemAppTheme]!.primaryColor,
              child:ListTile(
                title:Text(
                 itemAppTheme.name,
                  style:appThemeData[itemAppTheme]!.textTheme.titleSmall,
                ),
                onTap:()
                {
                  context.read<ThemeBloc>().add(ThemeChangedEvent(theme:itemAppTheme ));
                },
              ),
            );
          }),
    );
  }
}
