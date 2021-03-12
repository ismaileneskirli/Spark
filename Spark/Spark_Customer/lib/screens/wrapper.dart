import 'package:flutter/material.dart';
import 'package:gsu_park/screens/authenticate/authenticate.dart';
import 'package:gsu_park/screens/home/home.dart';
import 'package:gsu_park/models/user.dart';
import "package:provider/provider.dart";

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // access user data from provider.
    final user = Provider.of<User>(context);
    // if user value is null then it means user is logged out
    // if not then it means i need to show home screen


    // return either home or Authenticate widget
     if (user == null){
      return Authenticate();
    }
     else{
       return Home();
     }
  }
}
