import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:recipeapp2/view/widgets/recipe_cards/recipe_card_widgets.dart';

import '../../presenter/blocs/add_recipe/bloc/add_recipe_bloc.dart';

CustomPopUpCard(BuildContext context, bool comments) {
  TextEditingController _commentController = TextEditingController();
  bool isComments = comments;
  double dialogHeight;

  AlignmentGeometry cardAlignment; // laikinas
  Color cardColor;

  if (isComments) {
    dialogHeight = 0.6;
    cardAlignment = Alignment.bottomCenter;
    cardColor = Colors.white;
  } else {
    dialogHeight = 0.26;
    cardAlignment = Alignment.center;
    cardColor = Colors.yellow[700]!;
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: cardAlignment,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height * dialogHeight,
              width: double.infinity,
              color: cardColor,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: isComments
                          ? [
                              BuildText(
                                flex: 7,
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
                                child: BuildButton(
                                  buttonText: 'Ikelti',
                                  buttonColor: Theme.of(context).primaryColor,
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
                              TimePickerSpinner(
                                spacing: 40,
                                minutesInterval: 5,
                                onTimeChange: (time) {
                                  String cookTime =
                                      DateFormat('H:m').format(time);
                                  context
                                      .read<AddRecipeBloc>()
                                      .add(RecipeTimeChanged(time: cookTime));
                                },
                              ),
                            ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}
