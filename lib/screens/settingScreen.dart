import 'package:flutter/material.dart';
import 'package:meals/components/mainDrawer.dart';
import '../models/settings.dart';

class SettingScreen extends StatefulWidget {

  final Settings settings;

  final Function(Settings) onSettingChanged;

  const SettingScreen(this.onSettingChanged, this.settings);

  @override
  _SettingScreenState createState() =>  _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  late Settings settings;

  @override
  void initState() {

    super.initState();

    settings =widget.settings;

  }

  Widget _createSwitch(

    String title, 
    
    String subtitle, 

    bool value, 

    Function(bool) onChanged 

  ) {

    return SwitchListTile(

      title: Text(title),

      subtitle: Text(subtitle),

      value: value,

      onChanged: (value) {

        onChanged(value);

        widget.onSettingChanged(settings);

      }

    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Configurações'),

      ),

      drawer: MainDrawer(),

      body: Column(

        children: [

          Container(

            padding: EdgeInsets.all(20),

            child: Text(

              'Configurações',

              style: TextStyle(

                color: Theme.of(context).primaryColor

              )

            ),

          ),

          Expanded(

            child: ListView(

              children: [

                _createSwitch(
                  
                  'Sem Glutén',
                  
                  'Exibe refeições sem glutén.', 
                  
                  settings.isGlutenFree, 
                  
                  (value) => setState(() => settings.isGlutenFree = value)
                ),

                _createSwitch(
                  
                  'Sem Lactose',
                  
                  'Exibe refeições sem lactose.', 
                  
                  settings.isLactoseFree, 
                  
                  (value) => setState(() => settings.isLactoseFree = value)
                ),

                _createSwitch(
                  
                  'Vegetariana',
                  
                  'Exibe somente refeições vegetarianas.', 
                  
                  settings.isVegetarian, 
                  
                  (value) => setState(() => settings.isVegetarian = value)
                ),

                _createSwitch(
                  
                  'Vegana',
                  
                  'Exibe somente refeições veganas.', 
                  
                  settings.isVegan, 
                  
                  (value) => setState(() => settings.isVegan = value)
                )
              ],

            ),

          )

        ],

      )

    );

  }
}