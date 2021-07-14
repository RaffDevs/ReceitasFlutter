import 'package:flutter/material.dart';
import '../utils/mealsRouter.dart';

class MainDrawer extends StatelessWidget {

  Widget _createItem(IconData icon, String label, Function navigateTo) {

    return ListTile(

      leading: Icon(

        icon,

        size: 26,

      ),

      title: Text(

        label,

        style: TextStyle(

          fontFamily: 'RobotoCondensed-Regular',

          fontSize: 24,

          fontWeight: FontWeight.bold

        ),

      ),

      onTap: () => navigateTo()

    );

  }

  @override
  Widget build(BuildContext context) {

    return Drawer(

      child: Column(

        children: [

          Container(

            height: 120,

            width: double.infinity,

            padding: EdgeInsets.all(20),

            color: Theme.of(context).primaryColor,

            alignment: Alignment.bottomCenter,

            child: Text(

              'Vamos Cozinhar?',

              style: TextStyle(

                fontWeight: FontWeight.w900,

                fontSize: 30,

                color: Colors.white

              ),

            ),

          ),

          SizedBox(height: 20),

          _createItem(

            Icons.restaurant,

            'Refeições',

            () => Navigator.of(context).pushReplacementNamed(MealsRouter.HOME)

          ),

          _createItem(

            Icons.settings,

            'Configurações',

            () => Navigator.of(context).pushReplacementNamed(MealsRouter.SETTINGS)

          )

        ],

      ),

    );

  }

}