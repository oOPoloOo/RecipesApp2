import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/widgets_export.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const String routeName = '/details';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => RecipeDetailsScreen());
  }

  const RecipeDetailsScreen({Key? key}) : super(key: key);

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
            MealImage(media: media),
            InputAndDetailsCard.details(
              media: media,
            ),
          ],
        ),
      ),
    );
  }
}
