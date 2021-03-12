import 'package:flutter/material.dart';
import 'package:gsu_park/screens/wrapper.dart';
import 'package:gsu_park/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:gsu_park/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  // Here i listen for auth changes.
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper (),
      ),
    );
  }
}
