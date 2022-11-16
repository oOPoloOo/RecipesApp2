import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipeapp2/view/widgets/widgets_export.dart';

import '../../models/models_export.dart';

class CategoryCarousel extends StatelessWidget {
  final List<Recipe> recipes; // pakeist i categories
  final bool isHome;
  final bool isAdd;

  const CategoryCarousel.homePage({
    Key? key,
    required this.recipes,
    this.isHome = true,
    this.isAdd = false,
  }) : super(key: key);

  const CategoryCarousel.addPage({
    Key? key,
    required this.recipes,
    this.isHome = false,
    this.isAdd = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 1.5,
            viewportFraction: 0.3,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
          items: recipes
              .map((recipe) => isHome
                  ? CategoryCard.homePage(
                      recipe: recipe,
                    )
                  : CategoryCard.addPage(
                      recipe: recipe,
                    ))
              .toList()),
    );
  }
}
