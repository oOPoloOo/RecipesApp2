import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/models_export.dart';
import '../../repositories/recipes/recipes_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RecipesRepository _recipesRepository;
  StreamSubscription? _recipesSubscription;

  HomeBloc({required recipesRepository})
      : _recipesRepository = recipesRepository,
        super(RecipesLoading()) {
    on<LoadRecipes>(_onLoadRecipes);
    on<UpdateRecipes>(_onUpdateRecipes);
  }

  void _onLoadRecipes(event, Emitter<HomeState> emit) async {
    _recipesSubscription?.cancel();
    _recipesSubscription = _recipesRepository.getAllRecipes().listen(
          (recipes) => add(
            UpdateRecipes(recipes),
          ),
        );
  }

  void _onUpdateRecipes(UpdateRecipes event, Emitter<HomeState> emit) async {
    emit(RecipesLoaded(recipes: event.recipes));
  }
}
