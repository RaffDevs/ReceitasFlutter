import 'package:flutter/material.dart';

import '../models/category.dart';

import '../components/mealItem.dart';

import '../models/meal.dart';

class MealsCategoryScreen extends StatelessWidget {

  final List<Meal> meals;

  const MealsCategoryScreen(this.meals);

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryMeals = meals.where((meal) => 
    meal.categories.contains(category.id)).toList();

    return Scaffold(

      appBar: AppBar(

        title: Text(category.title),

      ),

      body: ListView.builder(

        itemCount: categoryMeals.length,

        itemBuilder: (ctx, index) {

          final meal = categoryMeals[index];

          return MealItem(meal);

        },

      ),

    );

  }

}