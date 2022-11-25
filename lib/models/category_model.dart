import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  final String category;
  final String imageURL;

  Category({
    required this.category,
    required this.imageURL,
  });

  static Category fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json) =>
      Category(
        category: json.data()!['category'],
        imageURL: json.data()!['imageURL'],
      );
}
