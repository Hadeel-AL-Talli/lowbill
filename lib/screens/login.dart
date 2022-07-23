import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowbill/Helpers/helpers.dart';
import 'package:lowbill/controllers/fb_auth_controller.dart';
import 'package:lowbill/widgets/custom_button.dart';
import 'package:lowbill/widgets/custom_text_feild.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with Helpers {
  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
     _passwordTextEditingController = TextEditingController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
    super.dispose();
  }
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
            'WELCOME',
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
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Email', controller: _emailTextEditingController, prefixIcon: Icons.email),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppTextField(hint: 'Password', controller: _passwordTextEditingController, prefixIcon: Icons.lock , obscureText: true),
                ),
                
                // Row(
                //   children: [
                //     Checkbox(
                //       value: isChecked,
                //       onChanged: (value) {
                //         setState(() {
                //           isChecked = value!;
                //         });
                //       },
                //     ),
                //     Text(
                //       'Remember me ',
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 15,
                //           fontFamily: 'Merr'),
                //     ),
                //   ],
                // ),
                CustomButton(
                    onPress: ()async {
await performLogin();
                    }, text: 'login', color: Color(0xffF59A23)),
                    SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'Don\'t have an account ? ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          
                          fontFamily: 'Merr'),
                    ),
 InkWell(
  onTap: (){
    Navigator.pushNamed(context, '/register');
  },
   child: Text(
                        'Register ',
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
Future<void> performLogin() async {
    if (checkData()) {
      await login();
    }
  }

  bool checkData() {
    if (_emailTextEditingController.text.isNotEmpty &&
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

  Future<void> login() async {
    bool status = await FbAuthController().signIn(
        context: context,
        email: _emailTextEditingController.text,
        password: _passwordTextEditingController.text);
    if (status) {
      print('Done / login');
     Navigator.pushReplacementNamed(context, '/main_screen');
    }
  }

}
