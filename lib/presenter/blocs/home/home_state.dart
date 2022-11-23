part of 'home_bloc.dart';

abstract class HomeState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class RecipesLoading extends HomeState {}

class RecipesLoaded extends HomeState {
  final List<Recipe> recipes;

  RecipesLoaded({this.recipes = const <Recipe>[]});

  @override
  List<Object> get props => [recipes];
}
