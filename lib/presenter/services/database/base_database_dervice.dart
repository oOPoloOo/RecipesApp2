import 'package:recipeapp2/models/models_export.dart';

abstract class BaseDatabaseService {
  Stream<List<Recipe>> getAllRecipesQuery();

  uploadRecipeDataQuery(Recipe recipe);

  Stream<List<Category>> getAllCategoriesQuery();
}
