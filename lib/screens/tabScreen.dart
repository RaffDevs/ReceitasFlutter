import 'package:flutter/material.dart';
import './categorieScreen.dart';
import './favoriteScreen.dart';
import '../components/mainDrawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _selectedScreenIndex = 0;

  late final List<Map<String, dynamic>> _screens;

  @override
  void initState() {

    super.initState();

    this._screens = [

      { 'title': 'Categorias', 'screen': CategorieScreen() },

      { 'title': 'Favoritos', 'screen': FavoriteScreen(widget.favoriteMeals) }

    ];

  }

  void _selectScreen(int index) {

    setState(() {
      
      _selectedScreenIndex = index;

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(
          
          _screens[_selectedScreenIndex]['title']
          
        ),

      ),

      drawer: MainDrawer(),

      body: _screens[_selectedScreenIndex]['screen'],

      bottomNavigationBar: BottomNavigationBar(

        onTap: _selectScreen,

        unselectedItemColor: Colors.white,

        selectedItemColor: Theme.of(context).accentColor,

        backgroundColor: Theme.of(context).primaryColor,

        currentIndex: _selectedScreenIndex,

        items: [

          BottomNavigationBarItem(

            icon: Icon(Icons.category),

            label: 'Categorias'

          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.star),

            label: 'Favoritos'

          )

        ],

      ),

    );

  }
}