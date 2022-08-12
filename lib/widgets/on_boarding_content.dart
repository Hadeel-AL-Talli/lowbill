import 'package:flutter/material.dart';

class OnBoardingContent extends StatelessWidget {
  String? imagepath;
  String? title;
  String? subTitle;

  OnBoardingContent({this.imagepath, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagepath!,height: 250,),
          SizedBox(
            height: 10.0,
          ),
          Text(title!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Merr')),
          SizedBox(
            height: 20,
          ),
          Text(subTitle!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontFamily: 'Merr')),
        ]);
  }
}
