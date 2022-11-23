part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadRecipes extends HomeEvent {}

class UpdateRecipes extends HomeEvent {
  final List<Recipe> recipes;

  UpdateRecipes(this.recipes);

  @override
  List<Object> get props => [recipes];
}
