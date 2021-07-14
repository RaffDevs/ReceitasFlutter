import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();

}


class _HomeState extends State<HomePage> {

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text('Vamos Cozinhar'),

      ),

      body: Text('Hello Meals'),

    );

  }

}