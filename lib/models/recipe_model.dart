import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  final String name;
  final String recipeDesc;
  final String cookTime;
  final String imgURL;
  final String category;
  final String? localImgPath;

  Recipe(
      {required this.name,
      required this.recipeDesc,
      required this.cookTime,
      required this.category,
      required this.imgURL,
      this.localImgPath});

  Map<String, dynamic> toJson() => {
        'name': name,
        'recipeDesc': recipeDesc,
        'imgURL': imgURL,
        'category': category,
        'cookTime': cookTime,
      };

  static Recipe fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) =>
      Recipe(
        name: json.data()!['name'],
        recipeDesc: json.data()!['recipeDesc'],
        imgURL: json.data()!['imgURL'],
        category: json.data()!['category'],
        cookTime: json.data()!['cookTime'],
      );
}
