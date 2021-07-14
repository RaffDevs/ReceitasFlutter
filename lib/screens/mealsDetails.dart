import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealsDetails extends StatelessWidget {

  final Function(Meal) onFavorite;

  final bool Function(Meal) isFavotire;

  const MealsDetails(this.onFavorite, this.isFavotire);

  Widget _createSectionTitle(String title) {

    return Container(

      margin: EdgeInsets.symmetric(vertical: 10),

      child: Text(

        title,

        style: TextStyle(

          color: Colors.black,

          fontSize: 20

        ),

      ),

    );

  }

  Widget _createSectionContainer(BuildContext context, Widget child) {

    return Container(
    
      width: MediaQuery.of(context).size.width * 0.8,
    
      height: MediaQuery.of(context).size.height * 0.25,
    
      padding: EdgeInsets.all(10),
    
      margin: EdgeInsets.all(10),
    
      decoration: BoxDecoration(
    
        color: Colors.white,
    
        borderRadius: BorderRadius.circular(10),
    
        border: Border.all(
    
          color: Theme.of(context).primaryColor
    
        )
    
      ),
    
      child: child,
    
    );

  }

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(

      appBar: AppBar(

        title: Text(meal.title),

      ),

      body: SingleChildScrollView(

        child: Column(
      
          children: [
      
            Container(
      
              height: 300,
      
              width: double.infinity,
      
              child: Image.network(
      
                meal.imageUrl,
      
                fit: BoxFit.cover,
                
              ),
      
            ),
      
            _createSectionTitle('Ingredientes'),
      
            _createSectionContainer(
              
              context, 
              
              ListView.builder(
      
                itemCount: meal.ingredients.length,
      
                itemBuilder: (ctx, index) {
      
                  return Card(
      
                    child: Padding(
      
                      padding: const EdgeInsets.symmetric(
      
                        vertical: 5,
      
                        horizontal: 10
      
                      ),
      
                      child: Text(
                        
                        meal.ingredients[index],
                        
                        style: TextStyle(

                          color: Colors.white

                        ),
                        
                      ),
      
                    ),
      
                    color: Theme.of(context).primaryColor
      
                  );
      
                },
      
              ),
            ),
      
            _createSectionTitle('Passos'),
      
            _createSectionContainer(
              
              context, 
              
              ListView.builder(
      
                itemCount: meal.steps.length,
      
                itemBuilder: (ctx, index) {
      
                  return Column(

                    children: [

                      ListTile(
      
                        leading: CircleAvatar(
      
                          child: Text('${index + 1}'),
      
                        ),

                        title: Text(meal.steps[index]),
      
                      ),

                      Divider(),
                    ],
                  );
      
                },
      
              )
              
            )
      
          ],
      
        ),
      ),

      floatingActionButton: FloatingActionButton(

        child: Icon(

          isFavotire(meal) ? Icons.star : Icons.star_border

        ),

        onPressed: () {

          onFavorite(meal);

        },



      ),

    );

  }

}