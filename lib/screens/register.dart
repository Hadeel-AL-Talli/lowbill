import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowbill/Helpers/helpers.dart';
import 'package:lowbill/widgets/custom_button.dart';
import 'package:lowbill/widgets/custom_text_feild.dart';

import '../controllers/fb_auth_controller.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> with Helpers{
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
   late TextEditingController _phoneTextEditingController;
    late TextEditingController _cityTextEditingController;
     late TextEditingController _nameTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
     _passwordTextEditingController = TextEditingController();
     _phoneTextEditingController = TextEditingController();
     _cityTextEditingController = TextEditingController();
     _nameTextEditingController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _nameTextEditingController.dispose();
    super.dispose();
  }
  
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
            'REGISTER',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'Merr'),
          ),
         
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 520.h,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Full Name', controller: _nameTextEditingController, prefixIcon: Icons.person),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Email', controller: _emailTextEditingController, prefixIcon: Icons.email),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Phone', controller: _phoneTextEditingController, prefixIcon: Icons.phone, keyboardType: TextInputType.number,),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'City', controller: _cityTextEditingController, prefixIcon: Icons.location_on),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Password', controller: _passwordTextEditingController, prefixIcon: Icons.lock , obscureText: true),
                ),
                
              SizedBox(height: 10.h,),
                CustomButton(
                    onPress: () async{
await performRegister();
                    }, text: 'Register', color: Color(0xffF59A23)),
                    SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Already a member? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          
                          fontFamily: 'Merr'),
                    ),
 InkWell(
  onTap: (){
    Navigator.pushNamed(context, '/login');
  },
   child: Text(
                        'Login ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.teal,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Merr'),
                      ),
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


   Future<void> performRegister() async {
    if(checkData()){
      await register();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&_nameTextEditingController.text.isNotEmpty&& _phoneTextEditingController.text.isNotEmpty && _cityTextEditingController.text.isNotEmpty &&
        _passwordTextEditingController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(
      context: context,
      message: 'Enter required data!',
      error: true,
    );
    return false;
  }

  Future<void> register() async {
    bool status = await FbAuthController().createAccount(context: context,name: _nameTextEditingController.text, email: _emailTextEditingController.text, password: _passwordTextEditingController.text  ,phone: _phoneTextEditingController.text , city: _cityTextEditingController.text);
    if(status) {
      print('register');
      Navigator.pop(context);
    }
  }
}
