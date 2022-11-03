import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipeapp2/models/models_export.dart';

import 'base_database_dervice.dart';

class DatabaseService extends BaseDatabaseService {
  final FirebaseFirestore _firebaseFirestore;

  DatabaseService({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  // @override
  // Future<List<Recipe>> getAllRecipesQuery() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot =
  //       await _firebaseFirestore.collection('Recipes').get();

  //   return snapshot.docs
  //       .map((docSnapshot) => Recipe.fromDocSnap(docSnapshot))
  //       .toList();
  // }

  @override
  Stream<List<Recipe>> getAllRecipesQuery() {
    return _firebaseFirestore.collection('Recipes').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Recipe.fromSnapshot(doc)).toList();
    });
  }
}
