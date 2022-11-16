// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/models/models_export.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';

import '../helpers/helpers_export.dart';
import '../widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';
  var backColor = Colors.amber[400];

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(backColor: backColor),
    );
  }

  PreferredSize _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        title: Text(
          'Cook Book',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.black,
              ),
        ),
        backgroundColor: backColor,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            icon: Icon(
              Icons.add,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Container(
              alignment: Alignment.center,
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Icon(Icons.person, color: Colors.black, size: 22),
            ),
          ),
        ],
      ),
    );
  }
}

class _buildBody extends StatelessWidget {
  const _buildBody({
    Key? key,
    required this.backColor,
  }) : super(key: key);

  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          ClipPath(
            clipper: CurvedClipPath(),
            child: Container(
              color: backColor,
            ),
          ),
          BlocBuilder<RecipesBloc, RecipesState>(
            builder: (context, state) {
              if (state is RecipesLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is RecipesLoaded) {
                return Column(
                  children: [
                    CategoryCarousel(recipes: state.recipes),
                    _buildRecipeCardsListView(recipes: state.recipes),
                  ],
                );
              } else {
                return Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}

class _buildRecipeCardsListView extends StatelessWidget {
  final List<Recipe> recipes;
  const _buildRecipeCardsListView({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          children: recipes
              .map(
                (recipe) => RecipeCard(
                  recipe: recipe,
                ),
              )
              .toList()),
    );
  }
}

class CategoryCarousel extends StatelessWidget {
  final List<Recipe> recipes; // pakeist i categories
  const CategoryCarousel({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.5,
          viewportFraction: 0.3,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
        ),
        items: recipes
            .map(
              (recipe) => CategoryCard.homePage(
                recipe: recipe,
              ),
            )
            .toList(),
      ),
    );
  }
}
