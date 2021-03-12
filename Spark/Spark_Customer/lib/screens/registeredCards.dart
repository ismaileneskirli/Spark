import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisteredCards extends StatefulWidget {
  @override
  _RegisteredCardsState createState() => _RegisteredCardsState();
}

class _RegisteredCardsState extends State <RegisteredCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kayıtlı Kartlarım"),
        ),

        body: Container(
          child:Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(

              children:<Widget> [
                Row(
                  children: [
                    Text("Kayıtlı Kartlarım",
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [
                    Image.asset(
                      'images/banka_logo.jpg',
                      width: 70,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10,),
                    Column(
                      children:<Widget> [
                        Text("Enpara Kartım",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),),
                        Text("2565 **** **** ****",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5)
                          ),)

                      ],
                    ),
                    SizedBox(width: 10,),
                    RaisedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.attach_money_rounded),
                      label: Flexible(
                          child:
                          Text("Varsayılan")),
                      color: Colors.grey[300],

                    )
                  ],

                ),



              ],
            ),
          ),

        )
    );
  }
}
