// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../models/models_export.dart';
import '../../widgets/widgets_export.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const String routeName = '/details';

  static Route route({required Recipe recipe}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => RecipeDetailsScreen(recipe: recipe));
  }

  final Recipe recipe;
  const RecipeDetailsScreen({required this.recipe});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(screen: routeName),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            MealImage.url(
              media: media,
              recipe: recipe,
            ),
            InputAndDetailsCard.details(
              media: media,
              recipe: recipe,
            ),
          ],
        ),
      ),
    );
  }
}
