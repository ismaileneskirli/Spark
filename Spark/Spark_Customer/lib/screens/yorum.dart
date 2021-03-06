import 'package:flutter/material.dart';

class Yorum extends StatefulWidget {
  @override
  _YorumState createState() => _YorumState();
}

class _YorumState extends State<Yorum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Yorumlar"),
        ),
    body: Container(
      child:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(

        children:<Widget> [
          Row(
            children: [
              Text("YORUMLAR",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.blue[700],
                    fontSize: 20
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
            Icon(
              Icons.person,
              size: 50,
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text("Yakınımda olduğu için tercih ettim,fiyatı gayet uygun."),
            ),
          ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Icon(
                Icons.person,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text("Arabayı temizlik hizmetide var, uygun fiyatlara siz gelene kadar arabayı tertemiz yapıyorlar, memnun kaldım."
                ),
              ),
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:<Widget> [
              Icon(
                Icons.person,
                size: 50,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text("Geldiğimde arabam yerindeydi buna da şükür."),
              ),
            ],

          ),

        ],
        ),
      ),

    )
    );
  }
}
