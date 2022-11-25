import 'package:recipeapp2/models/models_export.dart';
import 'package:recipeapp2/presenter/services/database/database_service.dart';
import 'base_recipes_repo.dart';

class RecipesRepository extends BaseRecipesRepository {
  DatabaseService db = DatabaseService();

  @override
  Stream<List<Recipe>> getAllRecipes() {
    return db.getAllRecipesQuery();
  }

  @override
  Stream<List<Recipe>> getAllCategories() {
    return db.getAllRecipesQuery();
  }

  @override
  Future<void> uploadRecipeData(Recipe recipe) {
    return db.uploadRecipeDataQuery(recipe);
  }
}
