// ignore_for_file: prefer_const_constructors

import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:recipeapp2/view/widgets/custom_popup_card.dart';
import 'package:flutter/material.dart';
import '../../../models/models_export.dart';
import 'recipe_card_widgets.dart';

class InputAndDetailsCard extends StatelessWidget {
  var _mealNameController = TextEditingController();
  var _descriptionController = TextEditingController();

  final Size media;
  final double cardHeight;
  final double cardWidth;

  final bool isAdd;
  final bool isDetails;

  final Recipe? recipe;

  InputAndDetailsCard.addRecipe({
    Key? key,
    required this.media,
    this.isAdd = true,
    this.isDetails = false,
    this.cardHeight = 0.6,
    this.cardWidth = 0.85,
    this.recipe,
  }) : super(key: key);

  InputAndDetailsCard.details({
    Key? key,
    required this.media,
    this.isAdd = false,
    this.isDetails = true,
    this.cardHeight = 0.6,
    this.cardWidth = 0.85,
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
          height: MediaQuery.of(context).size.height * cardHeight,
          width: MediaQuery.of(context).size.width * cardWidth,
          color: Colors.white,
          child: LayoutBuilder(
            builder: (context, constraint) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: isAdd
                    ? _addRecipeForm(
                        constraint: constraint,
                        mealNameController: _mealNameController,
                        descriptionController: _descriptionController,
                      )
                    : isDetails
                        ? _recipeDetailsCard(
                            recipe: recipe,
                            constraint: constraint,
                          )
                        : Center(
                            child: Text('Something went wrong!'),
                          ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _recipeDetailsCard extends StatelessWidget {
  const _recipeDetailsCard({
    Key? key,
    required this.recipe,
    required this.constraint,
  }) : super(key: key);

  final Recipe? recipe;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildText(
          flex: 1,
          constraint: constraint,
          fieldLabel: recipe!.name,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        BuildText(
          flex: 5,
          constraint: constraint,
          fieldLabel: recipe!.recipeDesc,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        BuildDurationText(
          flex: 1,
          constraint: constraint,
          cookTime: recipe!.cookTime,
          textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.black,
              ),
        ),
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              CustomPopUpCard(context, true);
            },
            child: Expanded(
              flex: 1,
              child: BuildButton(
                buttonText: 'Komentuoti',
                buttonColor: Theme.of(context).primaryColor,
                textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _addRecipeForm extends StatelessWidget {
  const _addRecipeForm({
    Key? key,
    required TextEditingController mealNameController,
    required TextEditingController descriptionController,
    required this.constraint,
  })  : _mealNameController = mealNameController,
        _descriptionController = descriptionController,
        super(key: key);

  final TextEditingController _mealNameController;
  final TextEditingController _descriptionController;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          BuildTextField(
            flex: 1,
            controller: _mealNameController,
            fieldLabel: "Enter Meal Name",
            constraint: constraint,
            textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          BuildTextField(
            flex: 4,
            controller: _descriptionController,
            fieldLabel: "Meal Description",
            constraint: constraint,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          BuildCategoryCarousel(),
          BuildTmePicker(),
          Expanded(
            child: GestureDetector(
              child: Expanded(
                flex: 1,
                child: BuildButton(
                  buttonText: 'Upload Recipe',
                  buttonColor: Theme.of(context).primaryColor,
                  textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
