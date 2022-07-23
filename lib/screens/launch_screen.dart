import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lowbill/controllers/fb_auth_controller.dart';
class LaunchScreen extends StatefulWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  late StreamSubscription streamSubscription ;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    Future.delayed(Duration (seconds:3 ) ,(){
   streamSubscription =    FbAuthController().checkUserState(
          listener: ({required bool status})
      {
             String route = status ? '/main_screen' : '/welcome_screen';
             Navigator.pushReplacementNamed(context, route);
      }
      );

    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    streamSubscription.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Container(
  alignment: Alignment.center,
  decoration: BoxDecoration(
   
  ),
  child: Container(
    child:  Image.asset('images/logo.png' , height: 150,width: 150,),
  )
  ),

    );
  }
}
