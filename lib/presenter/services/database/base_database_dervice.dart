import 'package:recipeapp2/models/models_export.dart';

abstract class BaseDatabaseService {
  Stream<List<Recipe>> getAllRecipesQuery();
}
