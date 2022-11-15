// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipeapp2/view/helpers/recipe_card_blur.dart';

import '../../models/models_export.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final double? blurTextHeight;
  final double? blurTextWidth;

  const RecipeCard({
    required this.recipe,
    this.blurTextHeight = 0.15,
    this.blurTextWidth = 0.85,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Stack(
              children: <Widget>[
                Image.network(recipe.imgURL, fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  child: RecipeCardBlur(
                    child: Container(
                      alignment: Alignment.center,
                      height:
                          MediaQuery.of(context).size.height * blurTextHeight!,
                      width: constraint.biggest.width,
                      color: Colors.transparent.withOpacity(0.4),
                      // ignore: prefer_const_constructors
                      child: Container(
                        width: constraint.biggest.width * blurTextWidth!,
                        child: Row(
                          children: [
                            _recipeName(recipe: recipe),
                            _recipeTime(recipe: recipe),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _recipeTime extends StatelessWidget {
  const _recipeTime({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${recipe.cookTime}',
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
          Text(
            'min.',
            style: Theme.of(context).textTheme.headlineMedium!,
          ),
        ],
      ),
    );
  }
}

class _recipeName extends StatelessWidget {
  const _recipeName({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Text(
        recipe.name,
        style: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
