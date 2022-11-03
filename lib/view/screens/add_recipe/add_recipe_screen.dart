// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';

class AddRecipeScreen extends StatelessWidget {
  static const String routeName = '/add';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => AddRecipeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add recipe'),
      ),
      body: Container(
        child: Container(
          child: Text('Recipe to Add'),
        ),
      ),
    );
  }
}
