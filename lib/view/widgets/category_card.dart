// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipeapp2/view/helpers/recipe_card_blur.dart';

import '../../models/models_export.dart';

class CategoryCard extends StatelessWidget {
  final Recipe recipe;
  final bool isHome;
  final bool isAdd;

  const CategoryCard.homePage({
    required this.recipe,
    this.isHome = true,
    this.isAdd = false,
  });

  const CategoryCard.addPage({
    required this.recipe,
    this.isHome = false,
    this.isAdd = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: isHome
            ? [
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
                Text(
                  recipe.category,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ]
            : [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(recipe.imgURL),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(color: Colors.blue, width: 3.5),
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
