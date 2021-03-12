import 'package:flutter/material.dart';
import 'package:spark_otopark/SlideTransition.dart';
import 'package:spark_otopark/generate.dart';
import 'package:spark_otopark/scan.dart';
import 'package:spark_otopark/signIn.dart';
//sidebar
class MainDrawer extends StatelessWidget {
  int counter;
  MainDrawer({this.counter});
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: <Widget> [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.teal,
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
                      "Ahmet Yıldırım",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "ahmet@gmail.com",
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
              leading: Icon(Icons.qr_code),
              title: Text("QR Kod Tarayıcı",style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.push(context, SlideTopRoute(page: ScanPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code),
              title: Text("QR Kod Üretici",style: TextStyle(fontSize: 18),),
              onTap: (){
                Navigator.push(context, SlideTopRoute(page: GeneratePage(counter: counter,)));
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("Çıkış yap",style: TextStyle(fontSize: 18),),
              onTap: () async {
                Navigator.push(context,SlideTopRoute(page: SignIn(counter: counter,)));
              },
            ),
          ],
        )
    );
  }
}
