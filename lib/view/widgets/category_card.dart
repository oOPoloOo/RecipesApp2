// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipeapp2/view/helpers/recipe_card_blur.dart';

import '../../models/models_export.dart';

class CategoryCard extends StatelessWidget {
  final Recipe recipe;

  const CategoryCard({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18.0),
                  child: Image.network(recipe.imgURL,
                      fit: BoxFit.cover, width: 1000.0),
                ),
              ),
            ),
            Container(
              child: Text(
                recipe.category,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
