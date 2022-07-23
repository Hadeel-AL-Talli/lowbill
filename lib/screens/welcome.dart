import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowbill/widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 125, 108),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Image.asset(
            'images/logo.png',
            height: 130.h,
            width: 130.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'LOWBILL',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merr'),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Smart Saving..',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merr'),
              ),
              Text(
                'توفير بذكاء',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Merr'),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    onPress: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    text: 'Register',
                    color: Color(0xffF59A23)),
                SizedBox(
                  height: 20.h,
                ),
                CustomButton(
                    onPress: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    text: 'login',
                    color: Color(0xffF59A23)),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Agree to our terms and policies',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Merr'),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
