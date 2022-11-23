part of 'add_recipe_bloc.dart';

class AddRecipeState {
  final String photoURL;

  final String recipeName;
  bool get isValidRecipeName => recipeName.length > 3;

  final String description;
  bool get isValidDescription => description.length > 10;

  final String category;
  final DateTime? time;
  final FormSubmissionStatus formStatus;

  const AddRecipeState({
    this.photoURL = '',
    this.recipeName = '',
    this.description = '',
    this.category = '',
    this.time = null,
    this.formStatus = const InitialFormStatus(),
  });

  AddRecipeState copyWith({
    String? photoURL,
    String? recipeName,
    String? description,
    String? category,
    DateTime? time,
    FormSubmissionStatus? formStatus,
  }) {
    return AddRecipeState(
      photoURL: photoURL ?? this.photoURL,
      recipeName: recipeName ?? this.recipeName,
      description: description ?? this.description,
      category: category ?? this.category,
      time: time ?? this.time,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
