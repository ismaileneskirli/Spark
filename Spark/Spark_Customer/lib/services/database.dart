import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gsu_park/models/parkUser.dart';
import 'package:gsu_park/models/user.dart';

class DatabaseService{
//collection reference  if i want to read or write to collection:
final CollectionReference userCollection = Firestore.instance.collection("users");

final String uid;
DatabaseService({this.uid});

// Information for users that i wanna keep   : name , plate
Future updateUserData (String name, String plate) async{
  return await userCollection.document(uid).setData({
    "uid" : uid,
    "name" :name,
    "plate" : plate,
  });
}

// list ParkUsers from snapshot
  List <ParkUser> _userListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc) {
    return ParkUser(
      name: doc.data["name"] ?? "" , // if there is no name on the db just give empty string
      plate: doc.data["plate"] ?? "",
  );}
  ).toList();
  }

//get user stream, this will notify me for any changes.
Stream <List<ParkUser>> get users {
  return userCollection.snapshots().map(_userListFromSnapshot);
}
}