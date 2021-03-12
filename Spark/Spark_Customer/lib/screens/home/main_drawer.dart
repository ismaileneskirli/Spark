import 'package:flutter/material.dart';
import 'package:gsu_park/services/auth.dart';
import 'package:gsu_park/Transitions/ScaleTransition.dart';
import 'package:gsu_park/screens/userInfo.dart';
import 'package:gsu_park/screens/authenticate/sign_in.dart';
import  "package:gsu_park/screens/qrscancode.dart";
//sidebar
class MainDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue,
            child: Center(
              child: Column(
                children:<Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://www.kindpng.com/picc/m/495-4952535_create-digital-profile-icon-blue-user-profile-icon.png',
                      ),
                          fit: BoxFit.fill
                    ),
                  ),
                  ),
                  Text(
                      "Ayşe Tamer",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "aysetamer@gmail.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),

          ListTile(
              leading: Icon(Icons.person),
              title: Text("Kullanıcı Bilgileri",style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.push(context, ScaleRoute(page: UserInfo()));
            },
          ),
          ListTile(
              leading: Icon(Icons.qr_code),
              title: Text("QR Kod Tarayıcı",style: TextStyle(fontSize: 18),),
            onTap: (){
              Navigator.push(context, ScaleRoute(page: QrCodeScan()));
            },
          ),
          ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("Çıkış yap",style: TextStyle(fontSize: 18),),
            onTap: () async {
              //Navigator.push(context, ScaleRoute(page: SignIn()));
              await _auth.signOut();
            },
          ),
        ],
      )
    );
  }
}
