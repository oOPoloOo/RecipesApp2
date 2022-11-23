// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets_export.dart';

class AddRecipeScreen extends StatelessWidget {
  static const String routeName = '/add';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => AddRecipeScreen());
  }

  double mediaHeightDivider = 5.5;
  double mediaWidthDivider = 2.6;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(screen: routeName),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            MealImage.base(media: media),
            _buildAddSign(
              media: media,
              mediaHeightDivider: mediaHeightDivider,
              mediaWidthDivider: mediaWidthDivider,
            ),
            InputAndDetailsCard.addRecipe(
              media: media,
            ),
          ],
        ),
      ),
    );
  }
}

class _buildAddSign extends StatelessWidget {
  const _buildAddSign({
    Key? key,
    required this.media,
    required this.mediaHeightDivider,
    required this.mediaWidthDivider,
  }) : super(key: key);

  final Size media;
  final double mediaHeightDivider;
  final double mediaWidthDivider;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: media.height / mediaHeightDivider,
      left: media.width / mediaWidthDivider,
      child: GestureDetector(
        // onTap: () => selectPhoto(context),
        onTap: () {},
        child: Icon(
          Icons.add_rounded,
          color: Colors.grey.withOpacity(0.3),
          size: 100,
        ),
      ),
    );
  }
}
