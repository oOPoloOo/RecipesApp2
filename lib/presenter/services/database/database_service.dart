import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeapp2/models/models_export.dart';

import 'base_database_dervice.dart';

class DatabaseService extends BaseDatabaseService {
  final FirebaseFirestore _firebaseFirestore;

  DatabaseService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Recipe>> getAllRecipesQuery() {
    return _firebaseFirestore.collection('Recipes').snapshots().map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => Recipe.fromSnapshot(doc),
          )
          .toList();
    });
  }

  @override
  uploadRecipeDataQuery(Recipe recipe) async {
    await _firebaseFirestore
        .collection('Recipes')
        .doc(recipe.name)
        .set(recipe.toJson());
  }

  @override
  Stream<List<Category>> getAllCategoriesQuery() {
    return _firebaseFirestore
        .collection('Categories')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map(
            (doc) => Category.fromSnapshot(doc),
          )
          .toList();
    });
  }
}
