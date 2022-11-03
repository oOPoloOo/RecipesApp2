part of 'recipe_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipes extends RecipesEvent {}

class UpdateRecipes extends RecipesEvent {
  final List<Recipe> recipes;

  UpdateRecipes(this.recipes);

  @override
  List<Object> get props => [recipes];
}
