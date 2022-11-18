// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';
import 'package:recipeapp2/view/widgets/widgets_export.dart';

import '../../models/models_export.dart';

class InputAndDetailsCard extends StatelessWidget {
  final Size media;
  var _mealNameController = TextEditingController();
  var _descriptionController = TextEditingController();

  final double textSize = 10;
  final String fieldLabel = 'Enter meal name';
  final int flex = 1;

  final bool isAdd;
  final bool isDetails;
  final bool isComments;

  final Recipe? recipe;

  InputAndDetailsCard.addRecipe({
    Key? key,
    required this.media,
    this.isAdd = true,
    this.isDetails = false,
    this.isComments = false,
    required this.recipe,
  }) : super(key: key);

  InputAndDetailsCard.details({
    Key? key,
    required this.media,
    this.isAdd = false,
    this.isDetails = true,
    this.isComments = false,
    required this.recipe,
  }) : super(key: key);

  InputAndDetailsCard.comments({
    Key? key,
    required this.media,
    this.isAdd = false,
    this.isDetails = false,
    this.isComments = true,
    required this.recipe,
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
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  children: isAdd
                      ? [
                          _buildTextField(
                            flex: 1,
                            controller: _mealNameController,
                            fieldLabel: "Enter Meal Name",
                            constraint: constraint,
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          _buildTextField(
                            flex: 4,
                            controller: _mealNameController,
                            fieldLabel: "Meal Description",
                            constraint: constraint,
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
                          _buildCategoryCarousel(),
                          _buildTmePicker(),
                          Expanded(
                            child: GestureDetector(
                              child: Expanded(
                                flex: 1,
                                child: _buildButton(
                                  buttonText: 'Upload Recipe',
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                            ),
                          ),
                        ]
                      : isDetails
                          ? [
                              _buildText(
                                flex: 1,
                                constraint: constraint,
                                fieldLabel: recipe!.name,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              _buildText(
                                flex: 5,
                                constraint: constraint,
                                fieldLabel: recipe!.recipeDesc,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              _buildDurationText(
                                flex: 1,
                                constraint: constraint,
                                cookTime: recipe!.cookTime,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.black,
                                    ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: InputAndDetailsCard.comments(
                                              media: media),
                                        );
                                      },
                                    );
                                  },
                                  child: Expanded(
                                    flex: 1,
                                    child: _buildButton(
                                      buttonText: 'Komentuoti',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          : isComments
                              ? [
                                  _buildText(
                                    flex: 1,
                                    constraint: constraint,
                                    fieldLabel: "Komentarai",
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                          color: Colors.black,
                                        ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: _buildButton(
                                      buttonText: 'Ikelti',
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                            color: Colors.black,
                                          ),
                                    ),
                                  ),
                                ]
                              : [
                                  Center(
                                    child: Text('Something went wrong!'),
                                  ),
                                ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _buildDurationText extends StatelessWidget {
  const _buildDurationText({
    Key? key,
    required this.constraint,
    required this.textStyle,
    required this.cookTime,
    required this.flex,
  }) : super(key: key);

  final TextStyle textStyle;
  final BoxConstraints constraint;
  final int cookTime;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        width: constraint.biggest.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$cookTime min.',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class _buildText extends StatelessWidget {
  const _buildText({
    Key? key,
    required this.flex,
    required this.fieldLabel,
    required this.constraint,
    required this.textStyle,
  }) : super(key: key);

  final int flex;
  final String fieldLabel;
  final BoxConstraints constraint;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        width: constraint.biggest.width * 0.85,
        height: constraint.biggest.height * 0.2,
        alignment: Alignment.topLeft,
        child: Text(fieldLabel, style: textStyle),
      ),
    );
  }
}

class _buildButton extends StatelessWidget {
  const _buildButton({
    Key? key,
    required this.buttonText,
    required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.yellow[700],
      child: Text(
        buttonText,
        style: textStyle,
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
    required this.textStyle,
    required this.fieldLabel,
    required this.constraint,
  })  : _controller = controller,
        super(key: key);

  final int flex;
  final TextEditingController _controller;
  final TextStyle textStyle;
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
          maxLines: null,
          controller: _controller,
          style: textStyle,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: fieldLabel,
            hintStyle: textStyle,
          ),
        ),
      ),
    );
  }
}
