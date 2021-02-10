import 'package:flutter/material.dart';
import 'package:myplans/Services/auth.dart';




class MyHomePage extends StatefulWidget {
  static final String id='MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(icon:Icon(Icons.exit_to_app,color: Colors.purpleAccent,), onPressed: (){
            FireBase.signout(context);
          })
        ],
      ),


    );
  }
}
