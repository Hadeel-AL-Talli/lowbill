import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lowbill/widgets/custom_button.dart';

class Confirm extends StatefulWidget {
  const Confirm({Key? key}) : super(key: key);

  @override
  State<Confirm> createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
    
    iconTheme: IconThemeData(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('' , style: TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
      ),

      body: ListView(
        children: [
          SizedBox(height: 60,),
         Image.asset('images/check.png', height: 100, width: 100,),SizedBox(height: 40,),

        Center(child: Text('Your Payment was \n Successfuly added ', style: TextStyle(color: Colors.teal , fontWeight: FontWeight.bold, fontSize: 25),)),

        SizedBox(height: 20,),

        Padding(
          padding: const EdgeInsets.all(60.0),
          child: CustomButton(onPress: (){
            Navigator.pushNamed(context, '/main_screen');
          }, text: 'OK', color: Color(0xffF59A23)),
        )
        ],
      ),
    );
  }
}