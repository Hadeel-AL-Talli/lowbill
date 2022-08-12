import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        iconTheme: IconThemeData(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Location' , style: TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
      ),
    body:   Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/CleaningServices');
            },
            child: Center(
              child: Text('Select your location', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
            ),
          ),
    
         // Container(child: Image.asset('images/map.jpg', height: 100,width: 100,))
         
        ],
      ),
    );
  }
}