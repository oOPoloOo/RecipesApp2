// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/models/models_export.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Expanded(
        child: Container(
          height: 350,
          color: Colors.red,
          child: Text('Vrienas'),
        ),
      ),
      Container(
        height: 350,
        color: Colors.green,
        child: Text('Du'),
      ),
      Container(
        height: 350,
        color: Colors.yellow,
        child: Text('Trys'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Vertical sliding carousel demo')),
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
                  // height: MediaQuery.of(context).size.height,
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

class HeroCarouselCard extends StatelessWidget {
  final Recipe recipe;

  const HeroCarouselCard({
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              //Image.network(item, fit: BoxFit.cover, width: 1000.0),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // ignore: prefer_const_literals_to_create_immutables
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Text(
                    recipe.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
