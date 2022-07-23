import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:lowbill/controllers/fb_auth_controller.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions:[ 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(icon:Icon(Icons.logout), color: Colors.teal, onPressed: ()async{
await FbAuthController().signOut();
            Navigator.pushReplacementNamed(context, '/login');
            },),
          ),]
          
      ),


      body: Column(
        children: [
          FutureBuilder(
            future: FbAuthController().getCurrentUser(),
            builder: ( (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
        return Text("${snapshot.data}");
              }
              else {
                return Center(child: CircularProgressIndicator(),);
              }
            
          }))
        ],
      ),
    );
  }
}