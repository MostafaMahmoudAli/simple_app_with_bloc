
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_app_with_bloc/core/theme_cache_helper.dart';

import '../../../../core/themes.dart';

part 'theme_events.dart';
part 'theme_states.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeStates>
{
  ThemeBloc():super(InitialThemeState())
  {
    on<ThemeEvent>((event, emit)async {
      if(event is GetCurrentThemeEvent)
      {
        final themeIndex = await ThemeCacheHelper().getCachedThemeIndex();
        final theme =AppTheme.values
            .firstWhere((appTheme) =>appTheme.index== themeIndex);
        emit(LoadedThemeState(themeData:appThemeData[theme]!));

      }else if (event is ThemeChangedEvent)
      {
        final themeIndex = event.theme.index;
        await ThemeCacheHelper().cacheThemeIndex(themeIndex);
        emit(LoadedThemeState(themeData:appThemeData[event.theme]!));
      }
    });
  }

}