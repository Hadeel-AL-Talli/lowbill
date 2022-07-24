import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lowbill/Helpers/helpers.dart';
import 'package:lowbill/controllers/fb_user_controller.dart';
import 'package:lowbill/models/user.dart';
import 'package:lowbill/widgets/custom_button.dart';
import 'package:lowbill/widgets/custom_text_feild.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key, this.userData}) : super(key: key);
  final UserData? userData;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with Helpers {
   late TextEditingController _nameTextEditingController;
 // late TextEditingController _emailTextEditingController;
   late TextEditingController _cityTextEditingController;
  late TextEditingController _phoneTextEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextEditingController = TextEditingController(text: widget.userData?.name ?? '');
   // _emailTextEditingController = TextEditingController(text: widget.userData?.email ?? '');
    _cityTextEditingController = TextEditingController(text: widget.userData?.city ?? '');
    _phoneTextEditingController = TextEditingController(text: widget.userData?.phone ?? '');
  
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextEditingController.dispose();
   // _emailTextEditingController.dispose();
    _cityTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back , color: Colors.black,)),
        title: Text('Edit Profile', style: TextStyle(fontFamily: 'Merr' , color: Colors.black), ),

      ),

      body: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              //height: 400,
              child: ListView(

                children: [

                   SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(hint: 'Name', controller: _nameTextEditingController, prefixIcon: Icons.email),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: AppTextField(hint: 'Email', controller: _emailTextEditingController, prefixIcon: Icons.email),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(hint: 'Phone Number', controller: _phoneTextEditingController, prefixIcon: Icons.phone_android),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppTextField(hint: 'City', controller: _cityTextEditingController, prefixIcon: Icons.location_on),
                  ),

                  SizedBox(height: 30.h,),
                  CustomButton(onPress: () async=> await performProcess(), text: 'Save', color: Color(0xffF59A23))
                ]
              )

        ),
    );
  }
Future<void> performProcess ()async {
    if(checkData()){
   await process();
    }



  }

bool checkData(){
    if(_nameTextEditingController.text.isNotEmpty && _cityTextEditingController.text.isNotEmpty &&_phoneTextEditingController.text.isNotEmpty){
      return true;

    }
    showSnackBar(context: context, message: 'Enter required Data' , error:  true );
    return false ;
  }
 Future<void> process() async {
   bool status =   await FbUserController().update(user: userData);
if(status){
  Navigator.pop(context);
   showSnackBar(context: context, message: status ? 'Process success'  :'Process failed' , error:  !status);
 }

 }
 UserData get userData {
    UserData userdata = widget.userData == null ?   UserData() : widget.userData!;
     userdata.name = _nameTextEditingController.text;
    // userdata.email = _emailTextEditingController.text;
     userdata.city = _cityTextEditingController.text;
     userdata.phone = _phoneTextEditingController.text;
    return userdata;
 }

}