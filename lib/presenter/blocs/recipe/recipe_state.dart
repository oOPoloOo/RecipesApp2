part of 'recipe_bloc.dart';

abstract class RecipesState {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesLoading extends RecipesState {}

class RecipesLoaded extends RecipesState {
  final List<Recipe> recipes;

  RecipesLoaded({this.recipes = const <Recipe>[]});

  @override
  List<Object> get props => [recipes];
}
