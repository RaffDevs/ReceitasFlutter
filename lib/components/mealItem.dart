import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/utils/mealsRouter.dart';


class MealItem extends StatelessWidget {
  
  final Meal meal;

  MealItem(this.meal);

  void _selectMeal(BuildContext context) {

    Navigator.of(context).pushNamed(

      MealsRouter.MEALS_DETAILS,

      arguments: meal

    ).then((result) {

      if (result == null) {

        print('Sem resultado');

      } else {

        print('O nome da refeição é $result');

      }

    });

  }

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => _selectMeal(context),

      child: Card(

        shape: RoundedRectangleBorder(
    
          borderRadius: BorderRadius.circular(15)
    
        ),
    
        elevation: 5,
        
        margin: const EdgeInsets.all(10),
    
        child: Column(

          children: [

            Stack(

              children: [

                ClipRRect(

                  borderRadius: BorderRadius.only(

                    topLeft: Radius.circular(15),

                    topRight: Radius.circular(15)

                  ),

                  child: Image.network(
                    meal.imageUrl,
                
                    height: 250,
                
                    width: double.infinity,
                    
                    fit: BoxFit.cover,
                  ),

                ),

                Positioned(

                  bottom: 20,

                  right: 0,

                  child: Container(

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(

                        topLeft: Radius.circular(15),

                        bottomLeft: Radius.circular(15)

                      ),

                      color: Colors.black54,

                    ),
                
                    width: MediaQuery.of(context).size.width * 0.5,
                
                    padding: const EdgeInsets.symmetric(
                
                      vertical: 5,
                
                      horizontal: 20
                
                    ),
                
                    child: Text(
                
                      meal.title,
                
                      style: TextStyle(
                
                        fontSize: 26,
                
                        color: Colors.white
                        
                      ),
                
                      softWrap: true,
                
                      overflow: TextOverflow.fade,
                    ),
                
                  ),
                ),

              ],

            ),

            Padding(

              padding: EdgeInsets.all(20),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [

                  Row(

                    children: [

                      Icon(Icons.timer_rounded),

                      SizedBox(width: 6),

                      Text('${meal.duration} min'),

                    ],

                  ),

                  Row(

                    children: [

                      Icon(Icons.food_bank_rounded),

                      SizedBox(width: 6),

                      Text(meal.complexityText),

                    ],

                  ),

                  Row(

                    children: [

                      Icon(Icons.monetization_on_rounded),

                      SizedBox(width: 6),

                      Text(meal.costText),

                    ],

                  )

                ],

              ),

            )

          ],

        ),
    
      ),
    );

  }

}