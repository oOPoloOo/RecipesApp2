import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipeapp2/presenter/blocs/form_submission_status.dart';

part 'add_recipe_event.dart';
part 'add_recipe_state.dart';

class AddRecipeBloc extends Bloc<AddRecipeEvent, AddRecipeState> {
  AddRecipeBloc() : super(AddRecipeState()) {
    on<RecipePhotoChanged>(_onPhotoChanged);
    on<RecipeNameChanged>(_onNameChanged);
    on<RecipeDescriptionChanged>(_onDescriptionChanged);
    on<RecipeCategoryChanged>(_onCategoryChanged);
    on<RecipeTimeChanged>(_onTimeChanged);
    on<RecipeSubmitted>(_onRecipeSubmitted);
  }

  void _onPhotoChanged(event, Emitter<AddRecipeState> emit) async {
    emit(state.copyWith(photoURL: event.photoURL));
  }

  void _onNameChanged(event, Emitter<AddRecipeState> emit) {
    emit(state.copyWith(recipeName: event.recipeName));
  }

  void _onDescriptionChanged(event, Emitter<AddRecipeState> emit) {
    emit(state.copyWith(description: event.description));
  }

  void _onCategoryChanged(event, Emitter<AddRecipeState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _onTimeChanged(event, Emitter<AddRecipeState> emit) {
    emit(state.copyWith(time: event.time));
  }

  void _onRecipeSubmitted(event, Emitter<AddRecipeState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try {
      //await submit new recipe
      //emit state.copyWith(formStatus: SubmissionSuccess());
    } catch (e) {
      //emit state.copyWith(formStatus: SubmissionFailed(e));
    }
  }
}
