import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lowbill/Helpers/helpers.dart';
import 'package:lowbill/controllers/fb_auth_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lowbill/controllers/fb_user_controller.dart';
import 'package:lowbill/models/user.dart';
import 'package:lowbill/screens/bnScreens/edit_profile.dart';
import 'package:lowbill/widgets/custom_button.dart';
import 'package:lowbill/widgets/custom_text_feild.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, this.userdata}) : super(key: key);
  UserData? userdata;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with Helpers {
  late TextEditingController _nameTextEditingController;
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _emailTextEditingController;
  late TextEditingController _cityTextEditingController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextEditingController = TextEditingController();
    _nameTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
    _cityTextEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextEditingController.dispose();
    _nameTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _cityTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.logout),
            color: Colors.teal,
            onPressed: () async {
              await FbAuthController().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ),
      ]),

    

      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .where('id', isEqualTo: FbAuthController().currentUserId)
              .snapshots(),
          // stream: FbUserController().read(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              List<QueryDocumentSnapshot> document = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: document.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 500.h,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                document[index].get('name'),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Merr'),
                              ))),
                          SizedBox(
                            height: 10.h,
                          ),
                          // Container(
                          //     width: double.infinity,
                          //     height: 50.h,
                          //     decoration: BoxDecoration(
                          //       color: Colors.grey.shade100,
                          //       border: Border.all(color: Colors.grey),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Center(
                          //         child: Text(document[index].get('email'),
                          //             style: TextStyle(
                          //                 color: Colors.black,
                          //                 fontSize: 18,
                          //                 fontFamily: 'Merr')))),
                          //                  SizedBox(height: 10.h,),
                          Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(document[index].get('city'),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: 'Merr')))),
                                           SizedBox(height: 10.h,),
                          Container(
                              width: double.infinity,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(document[index].get('phone'),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontFamily: 'Merr')))),
                                          SizedBox(height: 40.h,),
                                          CustomButton(onPress: (){
                                            // navigate to edit profile 
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(userData: mapUserData(document[index]),)));
                                          }, text: 'Edit Profile', color: Color(0xffF59A23))
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Data :(',
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            }

          
          }),
    );
  }

  UserData mapUserData(QueryDocumentSnapshot documentSnapshot){
      UserData userdata = UserData();
      userdata.id = documentSnapshot.id;
      userdata.name = documentSnapshot.get('name');
     // userdata.email = documentSnapshot.get('email');
      userdata.city = documentSnapshot.get('city');
      userdata.phone = documentSnapshot.get('phone');
      return userdata;
  }
}
