import 'package:recipeapp2/models/models_export.dart';
import 'package:recipeapp2/presenter/services/database/database_service.dart';
import 'base_recipes_repo.dart';

class RecipesRepository extends BaseRecipesRepository {
  DatabaseService db = DatabaseService();

  Stream<List<Recipe>> getAllRecipes() {
    return db.getAllRecipesQuery();
  }
}
