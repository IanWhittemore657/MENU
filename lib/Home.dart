import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar
          (
          automaticallyImplyLeading: false,
          flexibleSpace:Row
            (
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 30, 10),
                child: Center(child: Text("Simple Food UI",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 10, 10),
                  child: Icon(Icons.fastfood,size:60),
                ),
              ),
            ],

          ),

          centerTitle: false,
          backgroundColor: Colors.lightBlueAccent[200],

        ),
      ),
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
          child: Column(

            children: <Widget>[
              Center(child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("MENU is an application which is a simple UI that can be expanded into a further App for delivery of foods or even just for viewing the nutrients of types of foods.",style: TextStyle(fontSize: 24),),
              ))
            ],
          ),
        ),
      )

    );
  }
}