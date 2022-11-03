import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models_export.dart';
import '../../repositories/recipes/recipes_repo.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipesRepository _recipesRepository;
  StreamSubscription? _recipesSubscription;

  RecipesBloc({required recipesRepository})
      : _recipesRepository = recipesRepository,
        super(RecipesLoading()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<UpdateRecipes>(_onUpdateRecipes);
  }

  void _onLoadRecipes(event, Emitter<RecipesState> emit) async {
    _recipesSubscription?.cancel();
    _recipesSubscription = _recipesRepository.getAllRecipes().listen(
          (recipes) => add(
            UpdateRecipes(recipes),
          ),
        );
  }

  void _onUpdateRecipes(UpdateRecipes event, Emitter<RecipesState> emit) async {
    emit(RecipesLoaded(recipes: event.recipes));
  }
}
