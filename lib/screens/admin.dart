import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lowbill/widgets/custom_button.dart';
import 'package:lowbill/widgets/custom_text_feild.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late TextEditingController name ;
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/ordersPage');
          }, icon: Icon(Icons.request_page, color: Colors.black,))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        title: const Text(
          'Admin ',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'Merr',
              fontSize: 22,
              fontWeight: FontWeight.w700),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          height: 500,
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                'Title',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5,),
             AppTextField(hint: 'Service Name', controller:name, prefixIcon: Icons.work),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Service Image',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container(

                 margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1, color: Color(0xff026E5B)),
              
            ),
                child: Center(child: ElevatedButton.icon(
             onPressed: () {},

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
              icon: const Icon(Icons.cloud_upload),
              label: const Text(
                'UPLOAD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )))),
             
            //  CustomTextFeild(_websiteTextController, 'Website'),
              const SizedBox(height: 15),
              CustomButton(onPress: (){}, text: 'Create', color: Color(0xffF59A23))
            ],
          ),
        ),
      ),
    );
  }
}