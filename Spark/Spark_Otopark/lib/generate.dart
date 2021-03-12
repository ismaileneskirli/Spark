import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:spark_otopark/main.dart';
import 'package:spark_otopark/SlideTransition.dart';

class GeneratePage extends StatefulWidget {

  int counter;
  GeneratePage({this.counter});
  @override
  State<StatefulWidget> createState() => GeneratePageState(counter);
}

class GeneratePageState extends State<GeneratePage> {
  int counter;
  GeneratePageState(this.counter);
  String qrData =
      "https://github.com/neon97";  // already generated qr code when the page opens

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('QR Code Üretici'),
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  QrImage(
                    //plce where the QR Image will be shown
                    data: qrData,
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Yeni QR Kod Üretici",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextField(
                    controller: qrdataFeed,
                    decoration: InputDecoration(
                      hintText: "Plakayı girin",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: FlatButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed: () async {
                        if (qrdataFeed.text.isEmpty) {        //a little validation for the textfield
                          setState(() {
                            print(counter);
                            qrData = "";
                          });
                        } else {
                          setState(() {
                            print(counter);
                            qrData = qrdataFeed.text;
                          });
                        }

                      },
                      child: Text(
                        "QR üret",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: FlatButton(
                      padding: EdgeInsets.all(15.0),
                      onPressed:(){
                        counter--;
                        Navigator.push(context,SlideTopRoute(page: MyHomePage(title: "'Spark Otopark Giriş !",counter: counter,)));
                      },
                      child: Text(
                        "Ödeme alındı anasayfaya dön",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue, width: 3.0),
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

      )

    );
  }

  final qrdataFeed = TextEditingController();
}