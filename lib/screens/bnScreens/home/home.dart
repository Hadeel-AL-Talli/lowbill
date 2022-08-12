import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 6,
     itemBuilder: (context, index) {
       return InkWell(
        onTap: (){
          print('clicked');

          // navigate to choose service
        },
         child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, '/location');
          },
           child: Container(
            
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.grey.shade200),
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Image.asset('images/cl.jpg',fit: BoxFit.cover,),
            ),
              
           ),
         ),
       );
     },
    );
  }
}