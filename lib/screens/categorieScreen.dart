import 'package:flutter/material.dart';
import '../components/categoryItem.dart';
import '../data/dummy_data.dart';

class CategorieScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GridView(

      padding: const EdgeInsets.all(20),
  
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
  
        childAspectRatio: 3 / 2,
  
        crossAxisSpacing: 20,
  
        mainAxisSpacing: 20,
  
      ),
  
      children: DUMMY_CATEGORIES.map((cat) {
  
        return CategoryItem(cat);
  
      }).toList() ,
  
    );

  }

}