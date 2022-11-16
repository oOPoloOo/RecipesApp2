// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presenter/blocs/recipe/recipe_bloc.dart';
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
  final _mealNameController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: Container(
        height: media.height,
        width: media.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBaseImage(media: media),
            _buildAddSign(
              media: media,
              mediaHeightDivider: mediaHeightDivider,
              mediaWidthDivider: mediaWidthDivider,
            ),
            _buildInputCard(
              media: media,
              mealNameController: _mealNameController,
              descriptionController: _descriptionController,
            ),
          ],
        ),
      ),
    );
  }
}

class _buildInputCard extends StatelessWidget {
  const _buildInputCard({
    Key? key,
    required this.media,
    required TextEditingController mealNameController,
    required TextEditingController descriptionController,
  })  : _mealNameController = mealNameController,
        _descriptionController = descriptionController,
        super(key: key);

  final Size media;
  final TextEditingController _mealNameController;
  final TextEditingController _descriptionController;
  final double textSize = 10;
  final String fieldLabel = 'Enter meal name';
  final int flex = 1;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: media.height * 0.26,
      left: (media.width - media.width * 0.85) / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          //I adjusted here for responsiveness problems on my device
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.85,
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                children: [
                  _buildTextField(
                    flex: 1,
                    controller: _mealNameController,
                    textSize: 19,
                    fieldLabel: "Enter Meal Name",
                    constraint: constraint,
                  ),
                  _buildTextField(
                    flex: 4,
                    controller: _mealNameController,
                    textSize: 10,
                    fieldLabel: "Meal Description",
                    constraint: constraint,
                  ),
                  Expanded(
                    child: BlocBuilder<RecipesBloc, RecipesState>(
                      builder: (context, state) {
                        if (state is RecipesLoading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is RecipesLoaded) {
                          return CategoryCarousel.addPage(
                              recipes: state.recipes);
                        } else {
                          return Text('Something went wrong.');
                        }
                      },
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.punch_clock),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.yellow[700],
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Upload Recipe',
                        // ignore: prefer_const_constructors
                        style: TextStyle(fontSize: textSize),
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

class _buildTextField extends StatelessWidget {
  const _buildTextField({
    Key? key,
    required this.flex,
    required TextEditingController controller,
    required this.textSize,
    required this.fieldLabel,
    required this.constraint,
  })  : _controller = controller,
        super(key: key);

  final int flex;
  final TextEditingController _controller;
  final double textSize;
  final String fieldLabel;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        width: constraint.biggest.width * 0.85,
        alignment: Alignment.topLeft,
        child: TextField(
          minLines: 1,
          maxLines: null, // Text fills parent
          controller: _controller,
          style: TextStyle(fontSize: textSize),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: fieldLabel,
            hintStyle: TextStyle(fontSize: textSize),
          ),
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

class _buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _buildAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            alignment: Alignment.center,
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(Icons.close, color: Colors.black, size: 22),
          ),
        ),
      ],
    );
  }
}

class _buildBaseImage extends StatelessWidget {
  const _buildBaseImage({
    Key? key,
    required this.media,
  }) : super(key: key);

  final Size media;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: const [
            Colors.black,
            Color.fromARGB(0, 0, 0, 0),
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height * 0.97));
      },
      blendMode: BlendMode.dstIn,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
        child: SizedBox(
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
