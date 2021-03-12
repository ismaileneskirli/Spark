import 'package:flutter/material.dart';
import 'package:gsu_park/models/parkUser.dart';
import 'package:provider/provider.dart';
import 'package:gsu_park/screens/home/parkUserTile.dart';


class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {

    final users = Provider.of<List<ParkUser>>(context);

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context,index){
        return ParkUserTile(user: users[0]);
      },
    );
  }
}
