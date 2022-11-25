import 'package:recipeapp2/models/models_export.dart';

abstract class BaseRecipesRepository {
  Stream<List<Recipe>> getAllRecipes();

  Stream<List<Recipe>> getAllCategories();

  Future<void> uploadRecipeData(Recipe recipe);
}
