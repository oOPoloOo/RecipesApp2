import 'package:flutter/material.dart';
import 'package:recipeapp2/view/widgets/recipe_cards/recipe_card_widgets.dart';

recipeCommentsCard(BuildContext context) {
  TextEditingController _commentController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
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
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Colors.black,
                                ),
                          ),
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
