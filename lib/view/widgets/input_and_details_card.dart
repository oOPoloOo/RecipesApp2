// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';
import 'package:recipeapp2/view/widgets/widgets_export.dart';

class InputAndDetailsCard extends StatelessWidget {
  final Size media;
  var _mealNameController = TextEditingController();
  var _descriptionController = TextEditingController();
  final double textSize = 10;
  final String fieldLabel = 'Enter meal name';
  final int flex = 1;

  final bool isAdd;
  final bool isDetails;
  final bool isCommets;

  InputAndDetailsCard.addRecipe({
    Key? key,
    required this.media,
    this.isAdd = true,
    this.isDetails = false,
    this.isCommets = false,
  }) : super(key: key);

  InputAndDetailsCard.details({
    Key? key,
    required this.media,
    this.isAdd = false,
    this.isDetails = true,
    this.isCommets = false,
  }) : super(key: key);

  InputAndDetailsCard.comments({
    Key? key,
    required this.media,
    this.isAdd = false,
    this.isDetails = false,
    this.isCommets = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: media.height * 0.37,
      left: (media.width - media.width * 0.85) / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width * 0.85,
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Column(
                  children: isAdd
                      ? [
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
                          _buildCategoryCarousel(),
                          _buildTmePicker(),
                          _buildButton(textSize: textSize),
                        ]
                      : isDetails
                          ? [Text('')]
                          : [Text('data')]);
            },
          ),
        ),
      ),
    );
  }
}

class _buildButton extends StatelessWidget {
  const _buildButton({
    Key? key,
    required this.textSize,
  }) : super(key: key);

  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}

class _buildTmePicker extends StatelessWidget {
  const _buildTmePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 2,
      child: Icon(Icons.punch_clock),
    );
  }
}

class _buildCategoryCarousel extends StatelessWidget {
  const _buildCategoryCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<RecipesBloc, RecipesState>(
        builder: (context, state) {
          if (state is RecipesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecipesLoaded) {
            return CategoryCarousel.addPage(recipes: state.recipes);
          } else {
            return const Text('Something went wrong.');
          }
        },
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
