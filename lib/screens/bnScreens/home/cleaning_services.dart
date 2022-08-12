import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lowbill/widgets/custom_button.dart';

class CleaningServices extends StatefulWidget {
  const CleaningServices({Key? key}) : super(key: key);

  @override
  State<CleaningServices> createState() => _CleaningServicesState();
}

class _CleaningServicesState extends State<CleaningServices> {
  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;
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
            Text('Choose at least one:' , style:TextStyle(color: Colors.teal, fontFamily: 'Merr', fontWeight: FontWeight.bold) ,),
             Row(
                    children: [
                      Checkbox(
                        value: isChecked1,
                        onChanged: (value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      Text(
                        'Furniture Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Checkbox(
                        value: isChecked2,
                        onChanged: (value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      Text(
                        'Floor Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Checkbox(
                        value: isChecked3,
                        onChanged: (value) {
                          setState(() {
                            isChecked3= value!;
                          });
                        },
                      ),
                      Text(
                        'Outdoor Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Checkbox(
                        value: isChecked4,
                        onChanged: (value) {
                          setState(() {
                            isChecked4= value!;
                          });
                        },
                      ),
                      Text(
                        'In-depth Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Checkbox(
                        value: isChecked5,
                        onChanged: (value) {
                          setState(() {
                            isChecked5 = value!;
                          });
                        },
                      ),
                      Text(
                        'Window Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),
                    Row(
                    children: [
                      Checkbox(
                        value: isChecked6,
                        onChanged: (value) {
                          setState(() {
                            isChecked6 = value!;
                          });
                        },
                      ),
                      Text(
                        'Rug Cleaning',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'Merr'),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: CustomButton(onPress: (){
                      Navigator.pushNamed(context, '/chooseday');
                    }, text: 'Next', color: Color(0xffF59A23)),
                  )
          ],
        ),
      ),
    );
  }
}