// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/models/models_export.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';

import '../widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work in progress...'),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Icon(
              Icons.add_circle,
            ),
          )
        ],
      ),
      body: Container(
        child: BlocBuilder<RecipesBloc, RecipesState>(
          builder: (context, state) {
            if (state is RecipesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RecipesLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  aspectRatio: 1,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.vertical,
                  autoPlay: false,
                ),
                items: state.recipes
                    .map(
                      (recipe) => HeroCarouselCard(
                        recipe: recipe,
                      ),
                    )
                    .toList(),
              );
            } else {
              return Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }
}
