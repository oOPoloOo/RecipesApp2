// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:recipeapp2/view/helpers/recipe_card_blur.dart';
import 'package:recipeapp2/view/widgets/recipe_cards/recipe_card_widgets.dart';

import '../../../models/models_export.dart';

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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details', arguments: recipe);
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Stack(
                children: <Widget>[
                  Image.network(
                    recipe.imgURL,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: RecipeCardBlur(
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height *
                            blurTextHeight!,
                        width: constraint.biggest.width,
                        color: Colors.transparent.withOpacity(0.4),
                        // ignore: prefer_const_constructors
                        child: Container(
                          width: constraint.biggest.width * blurTextWidth!,
                          child: Row(
                            children: [
                              BuildText.home(
                                flex: 7,
                                fieldLabel: recipe.name,
                                textStyle:
                                    Theme.of(context).textTheme.labelMedium!,
                              ),
                              BuildDurationText.home(
                                flex: 2,
                                cookTime: recipe.cookTime,
                                textStyle:
                                    Theme.of(context).textTheme.headlineMedium!,
                              ),
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
      ),
    );
  }
}
