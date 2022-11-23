// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/presenter/blocs/add_recipe/bloc/add_recipe_bloc.dart';
import 'package:recipeapp2/presenter/blocs/home/home_bloc.dart';

import '../widgets_export.dart';

class BuildText extends StatelessWidget {
  const BuildText({
    Key? key,
    required this.flex,
    required this.fieldLabel,
    required this.constraint,
    required this.textStyle,
    this.isHome = false,
  }) : super(key: key);

  const BuildText.home({
    Key? key,
    required this.flex,
    required this.fieldLabel,
    this.constraint,
    required this.textStyle,
    this.isHome = true,
  }) : super(key: key);

  final int flex;
  final String fieldLabel;
  final BoxConstraints? constraint;
  final TextStyle textStyle;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: isHome
          ? Text(
              fieldLabel,
              style: textStyle,
            )
          : Container(
              width: constraint!.biggest.width * 0.85,
              height: constraint!.biggest.height * 0.2,
              alignment: Alignment.topLeft,
              child: Text(fieldLabel, style: textStyle),
            ),
    );
  }
}

class BuildButton extends StatelessWidget {
  const BuildButton({
    Key? key,
    required this.buttonText,
    required this.textStyle,
    required this.buttonColor,
  }) : super(key: key);

  final TextStyle textStyle;
  final String buttonText;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: buttonColor,
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}

class BuildDurationText extends StatelessWidget {
  const BuildDurationText({
    Key? key,
    required this.constraint,
    required this.textStyle,
    required this.cookTime,
    required this.flex,
    this.isHome = false,
  }) : super(key: key);

  const BuildDurationText.home({
    Key? key,
    this.constraint,
    required this.textStyle,
    required this.cookTime,
    required this.flex,
    this.isHome = true,
  }) : super(key: key);

  final TextStyle textStyle;
  final BoxConstraints? constraint;
  final int cookTime;
  final int flex;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: isHome
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$cookTime',
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),
                Text(
                  'min.',
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),
              ],
            )
          : SizedBox(
              width: constraint!.biggest.width,
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

class BuildTmePicker extends StatelessWidget {
  const BuildTmePicker({
    Key? key,
    required this.constraint,
  }) : super(key: key);
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRecipeBloc, AddRecipeState>(
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              CustomPopUpCard(context, false);
            },
            child: state.time != null
                ? TextField(
                    enabled: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 30,
                      ),
                      border: InputBorder.none,
                      hintText:
                          '${state.time!.hour.toString().padLeft(2, '0')}:${state.time!.minute.toString().padLeft(2, '0')}',
                      hintStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                : const Icon(Icons.punch_clock),
          ),
        );
      },
    );
  }
}

class BuildCategoryCarousel extends StatelessWidget {
  const BuildCategoryCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
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

class BuildNameTextField extends StatelessWidget {
  const BuildNameTextField({
    Key? key,
    required this.flex,
    required this.textStyle,
    required this.constraint,
  }) : super(key: key);

  final int flex;
  final TextStyle textStyle;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRecipeBloc, AddRecipeState>(
      builder: (context, state) {
        return Expanded(
          flex: flex,
          child: Container(
            width: constraint.biggest.width * 0.85,
            alignment: Alignment.topLeft,
            child: TextFormField(
              minLines: 1,
              maxLines: null,
              style: textStyle,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                  top: 5,
                ),
                border: InputBorder.none,
                hintText: 'Enter Meal Name',
                hintStyle: textStyle,
              ),
              validator: (value) =>
                  state.isValidRecipeName ? null : 'Name is too short',
              onChanged: (value) => context.read<AddRecipeBloc>().add(
                    RecipeNameChanged(recipeName: value),
                  ),
            ),
          ),
        );
      },
    );
  }
}

class BuildDescriptionTextField extends StatelessWidget {
  const BuildDescriptionTextField({
    Key? key,
    required this.flex,
    required this.textStyle,
    required this.constraint,
  }) : super(key: key);

  final int flex;
  final TextStyle textStyle;
  final BoxConstraints constraint;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddRecipeBloc, AddRecipeState>(
      builder: (context, state) {
        return Expanded(
          flex: flex,
          child: Container(
            width: constraint.biggest.width * 0.85,
            alignment: Alignment.topLeft,
            child: TextFormField(
              minLines: 1,
              maxLines: null,
              style: textStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Recipe Description',
                hintStyle: textStyle,
              ),
              validator: (value) =>
                  state.isValidDescription ? null : 'Description is too short',
              onChanged: (value) => context.read<AddRecipeBloc>().add(
                    RecipeDescriptionChanged(description: value),
                  ),
            ),
          ),
        );
      },
    );
  }
}
