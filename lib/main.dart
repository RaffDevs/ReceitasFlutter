import 'package:flutter/material.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/mealsCategoryScreen.dart';
import 'package:meals/screens/mealsDetails.dart';
import 'package:meals/screens/settingScreen.dart';
import './screens/mealsCategoryScreen.dart';
import './utils/mealsRouter.dart';
import './screens/tabScreen.dart';
import './models/meal.dart';
import './data/dummy_data.dart';
main() => runApp(Meals());

class Meals extends StatefulWidget {
  @override
  _MealsState createState() => _MealsState();

}

class _MealsState extends State<Meals> {

  Settings settings = Settings();

  List<Meal>_avaiableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {

    setState(() {

      this.settings = settings;
      
      _avaiableMeals = DUMMY_MEALS.where((meal) {

        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;

        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;

        final filterVegan = settings.isVegan && !meal.isVegan;

        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian; 

      }).toList();

    });

  }

  void _toggleFavorite(Meal meal) {

    setState(() {
      
      _favoriteMeals.contains(meal) 
        ? _favoriteMeals.remove(meal) 
        : _favoriteMeals.add(meal);

    });

  }

  bool _isFavotire(Meal meal) {

    return _favoriteMeals.contains(meal);

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      theme: ThemeData(

        primarySwatch: Colors.brown,

        accentColor: Colors.amber,

        canvasColor: Colors.brown[50],

        fontFamily: 'Raleway',

        textTheme: ThemeData.light().textTheme.copyWith(

          headline6: TextStyle(

            fontSize: 20,

            fontFamily: 'RobotoCondensed-Regular',

            color: Colors.white

          )

        )

      ),

      routes: {

        MealsRouter.HOME : (ctx) => TabScreen(_favoriteMeals),

        MealsRouter.CATEGORIES_MEALS : (ctx) => MealsCategoryScreen(_avaiableMeals),

        MealsRouter.MEALS_DETAILS : (ctx) => MealsDetails(_toggleFavorite, _isFavotire),

        MealsRouter.SETTINGS : (ctx) => SettingScreen(_filterMeals, settings)

      }
    );

  }
}