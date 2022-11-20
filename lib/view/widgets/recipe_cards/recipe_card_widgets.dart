import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:recipeapp2/view/widgets/category_carousel.dart';

import '../../../presenter/blocs/recipe/recipe_bloc.dart';
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: () {
          CustomPopUpCard(context, false);
        },
        child: Icon(Icons.punch_clock),
      ),
    );

//Jei yra laikas rodyt laika
    // Container(
    //   // margin: const EdgeInsets.symmetric(vertical: 50),
    //   child: Text(
    //     '${_dateTime.hour.toString().padLeft(2, '0')}:${_dateTime.minute.toString().padLeft(2, '0')}:${_dateTime.second.toString().padLeft(2, '0')}',
    //     style: const TextStyle(
    //         fontSize: 18,
    //         fontWeight: FontWeight.bold),
    //   ),
    // ),
  }
}

class BuildCategoryCarousel extends StatelessWidget {
  const BuildCategoryCarousel({
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

class BuildTextField extends StatelessWidget {
  const BuildTextField({
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
