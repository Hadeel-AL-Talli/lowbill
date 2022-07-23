import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowbill/screens/bnScreens/main_screen.dart';
import 'package:lowbill/screens/launch_screen.dart';
import 'package:lowbill/screens/login.dart';
import 'package:lowbill/screens/register.dart';
import 'package:lowbill/screens/welcome.dart';

void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375 ,812),
      builder: (((context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/launch',
       routes: {
        '/launch':(context)=> LaunchScreen(),
        '/welcome_screen':(context) => WelcomeScreen(),
        '/login':(context)=> Login(),
        '/register':(context)=> Register(),
        '/main_screen':(context)=> MainScreen()
       },
      )
      )
    ));
    
  }
}