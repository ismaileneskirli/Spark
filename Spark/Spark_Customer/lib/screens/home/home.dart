import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gsu_park/screens/home/main_drawer.dart';
import 'package:gsu_park/screens/home/search.dart';
import 'package:gsu_park/services/auth.dart';
import 'package:gsu_park/services/database.dart';
import 'package:provider/provider.dart';
import "package:gsu_park/screens/home/userList.dart";
import 'package:gsu_park/models/parkUser.dart';
import 'package:gsu_park/screens/home/CustomPaintHome.dart';
import 'package:gsu_park/Widget/recents.dart';



class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<ParkUser>>.value (
      value: DatabaseService().users,
     child: Scaffold(
       backgroundColor: Colors.brown[50],
       appBar: AppBar(
         title: Text("Spark"),
         actions:<Widget> [
           IconButton(
               icon: Icon(Icons.search), onPressed: (){
             showSearch(context: context,delegate: DataSearch());
           }),
         ],
         backgroundColor: Colors.blue[400],
         elevation: 0.0,

       ),
       drawer: MainDrawer(),
       body: Stack(
         children:<Widget> [
           TopBar_home(),
           Column(
             children:<Widget> [
              Recents(),
             ],
           ),

         ],
       ),
    ),
    );
  }
}
