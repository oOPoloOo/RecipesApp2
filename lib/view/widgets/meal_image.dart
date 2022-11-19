import 'package:flutter/material.dart';

import '../../models/models_export.dart';

class MealImage extends StatelessWidget {
  const MealImage.base({
    Key? key,
    required this.media,
    this.recipe,
  }) : super(key: key);

  const MealImage.url({
    Key? key,
    required this.media,
    required this.recipe,
  }) : super(key: key);

  final Size media;
  final Recipe? recipe;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black,
            Color.fromARGB(0, 0, 0, 0),
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height * 0.97));
      },
      blendMode: BlendMode.dstIn,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        child: recipe != null
            ? AspectRatio(
                aspectRatio: 1,
                child: SizedBox(
                  height: media.height * 0.5,
                  child: Image.network(
                    recipe!.imgURL,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            : SizedBox(
                height: media.height * 0.5,
                child: Image.asset(
                  'assets/images/plateBlack.jpg',
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}


  // recipe != null
  //             ? Image.network(
  //                 recipe!.imgURL,
  //                 fit: BoxFit.cover,
  //               )
  //             : Image.asset(
  //                 'assets/images/plateBlack.jpg',
  //                 fit: BoxFit.cover,
  //               ),