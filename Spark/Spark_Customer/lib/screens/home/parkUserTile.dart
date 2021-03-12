import 'package:flutter/material.dart';
import 'package:gsu_park/models/parkUser.dart';

class ParkUserTile extends StatelessWidget {
  final ParkUser user;
  ParkUserTile({this.user});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
          ),
          title: Text(user.name),
        ),
      ),
    );
  }
}
