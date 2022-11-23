part of 'add_recipe_bloc.dart';

abstract class AddRecipeEvent {}

class RecipePhotoChanged extends AddRecipeEvent {
  final String photoURL;

  RecipePhotoChanged({required this.photoURL});
}

class RecipeNameChanged extends AddRecipeEvent {
  final String recipeName;

  RecipeNameChanged({required this.recipeName});
}

class RecipeDescriptionChanged extends AddRecipeEvent {
  final String description;

  RecipeDescriptionChanged({required this.description});
}

class RecipeCategoryChanged extends AddRecipeEvent {
  final String category;

  RecipeCategoryChanged({required this.category});
}

class RecipeTimeChanged extends AddRecipeEvent {
  final DateTime time;

  RecipeTimeChanged({required this.time});
}

class RecipeSubmitted extends AddRecipeEvent {}
