// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/presenter/blocs/form_submission_status.dart';
import 'package:recipeapp2/view/widgets/custom_popup_card.dart';
import 'package:flutter/material.dart';
import '../../../models/models_export.dart';
import '../../../presenter/blocs/add_recipe/bloc/add_recipe_bloc.dart';
import 'recipe_card_widgets.dart';

class InputAndDetailsCard extends StatelessWidget {
  static final formKey = new GlobalKey<FormState>();

  final Size media;
  final double cardHeight;
  final double cardWidth;

  final bool isAdd;
  final bool isDetails;

  final Recipe? recipe;

  const InputAndDetailsCard.addRecipe({
    Key? key,
    required this.media,
    this.isAdd = true,
    this.isDetails = false,
    this.cardHeight = 0.6,
    this.cardWidth = 0.85,
    this.recipe,
  }) : super(key: key);

  const InputAndDetailsCard.details({
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
                        formKey: formKey,
                        constraint: constraint,
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
          flex: 1,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              CustomPopUpCard(context, true);
            },
            child: BuildButton(
              buttonText: 'Komentuoti',
              buttonColor: Theme.of(context).primaryColor,
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
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
    required this.constraint,
    required this.formKey,
  }) : super(key: key);

  final BoxConstraints constraint;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          BuildNameTextField(
            flex: 2,
            constraint: constraint,
            textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          BuildDescriptionTextField(
            flex: 4,
            constraint: constraint,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                ),
          ),
          BuildCategoryCarousel(),
          BuildTmePicker(
            constraint: constraint,
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<AddRecipeBloc, AddRecipeState>(
              builder: (context, state) {
                return state.formStatus is FormSubmitting
                    ? Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                        ),
                        child: CircularProgressIndicator(),
                      )
                    : GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context
                                .read<AddRecipeBloc>()
                                .add(RecipeSubmitted());
                          }
                        },
                        child: BuildButton(
                          buttonText: 'Upload Recipe',
                          buttonColor: Theme.of(context).primaryColor,
                          textStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
