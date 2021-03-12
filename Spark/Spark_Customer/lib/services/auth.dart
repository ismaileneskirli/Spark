import 'package:firebase_auth/firebase_auth.dart';
import 'package:gsu_park/models/user.dart';
import 'package:gsu_park/services/database.dart';

class AuthService{
  final FirebaseAuth _auth =  FirebaseAuth.instance;

 // create user object based on  FirebaseUser
  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }

  // Auth change user stream

  Stream <User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFireBaseUser(user));
    .map(_userFromFireBaseUser);
  }

  // sign in anon
  Future signInAnon()  async {
    try{
    AuthResult result =await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFireBaseUser(user);
    } catch(e){
    print(e.toString());
    return null;
    }
  }


  //sign in with email&password

  Future signInWithEmailandPassword(String email,String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password:password) ;
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }

  // register with email& password
  Future registerWithEmailandPassword(String email,String password)async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password:password) ;
      FirebaseUser user = result.user;
      // create a new document  for the user with uid
      await DatabaseService(uid : user.uid).updateUserData("New User", "34 AA 001");
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;

    }
  }
  // sign out

Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
  return null;
    }
}



}