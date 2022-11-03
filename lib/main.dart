import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipeapp2/presenter/blocs/recipe/recipe_bloc.dart';
import 'package:recipeapp2/presenter/repositories/recipes/recipes_repo.dart';
import 'package:recipeapp2/view/screens/screens_export.dart';
import 'view/config/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipesBloc(
        recipesRepository: RecipesRepository(),
      )..add(LoadRecipes()),
      child: MaterialApp(
        title: 'Recipe App 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
