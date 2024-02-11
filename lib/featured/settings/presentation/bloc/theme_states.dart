
part of "theme_bloc.dart";


abstract class ThemeStates extends Equatable
{
  const ThemeStates();

  List<Object>get prop=>[];
}

class InitialThemeState extends ThemeStates
{
  @override
  List<Object?> get props =>[];
}

class LoadedThemeState extends ThemeStates
{
  final ThemeData themeData;
  const LoadedThemeState({required this.themeData});
  @override
  List<Object?> get props => [themeData];

}