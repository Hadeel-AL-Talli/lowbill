import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lowbill/models/bn_screen.dart';
import 'package:lowbill/screens/bnScreens/home.dart';
import 'package:lowbill/screens/bnScreens/offers.dart';
import 'package:lowbill/screens/bnScreens/orders.dart';
import 'package:lowbill/screens/bnScreens/profile.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<BnScreen> _bnScreens = <BnScreen>[
    const BnScreen(widget: Home()),
    const BnScreen(widget: Orders()),
    const BnScreen(widget: Offers()),
     BnScreen(widget: Profile()),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreens[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14),
        ///selectedLabelStyle: TextStyle(color: Colors.white, fontSize: 14),
         //unselectedIconTheme: IconThemeData(color: Colors.grey.shade700),
        unselectedFontSize: 12,
        backgroundColor: Colors.teal,
        elevation: 10,
       
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
          });
          
        },
        currentIndex: _currentIndex,
         type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
             
              icon: const Icon(
                Icons.home_outlined,
                size: 25,
                color: Colors.white,
              ),
              label:  
                "Home",
             
          ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.summarize_outlined,
                  size: 25, color: Colors.white),
              label:  
                "Orders",
             ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.percent,
                  size: 25, color: Colors.white),
              label:  
                "Offers",
      ),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline,
                  size: 25, color: Colors.white),
              label: 
                "Profile",
             
          ),
        ]
      )    
    );
  }
}
