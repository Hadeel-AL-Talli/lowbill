import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lowbill/widgets/custom_button.dart';

class ChooseDay extends StatefulWidget {
  const ChooseDay({Key? key}) : super(key: key);

  @override
  State<ChooseDay> createState() => _ChooseDayState();
}

class _ChooseDayState extends State<ChooseDay> {
  Object? val;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Cleaning Services' , style: TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            Text('Choose a Day' , style:TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold) ,),
            Row(
              children: [
                
                Radio(value: 1, groupValue: val, onChanged: (newValue){
                  setState(() {
                    val = newValue;
                  });
                }),
                Text('Sunday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
              ],
            ),
             Row(
              children: [
                
                Radio(value: 2, groupValue: val, onChanged: (newValue){
                   setState(() {
                    val = newValue;
                  });
                }),
                Text('Monday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                
                Radio(value: 3, groupValue: val, onChanged: (newValue){
                   setState(() {
                    val = newValue;
                  });
                }),
                Text('Tuesday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                
                Radio(value: 4, groupValue: val, onChanged: (newValue){
                   setState(() {
                    val = newValue;
                  });
                }),
                Text('Wednesday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                
                Radio(value: 5, groupValue: val, onChanged: (newValue){
                   setState(() {
                    val = newValue;
                  });
                }),
                Text('Thursday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),
              ],
            ),
            Row(
              children: [
                
                Radio(value: 6, groupValue: val, onChanged: (newValue){
                   setState(() {
                    val = newValue;
                  });
                }),
                Text('Friday',style: TextStyle(color: Colors.black, fontFamily: 'Merr', fontWeight: FontWeight.bold),),


               
              ],
            ),

             Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CustomButton(onPress: (){
                      Navigator.pushNamed(context, '/payment');
                    }, text: 'Next', color: Color(0xffF59A23)),
                  )
          ],
        ),
      ),
    );
  }
}