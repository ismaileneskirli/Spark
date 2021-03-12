import 'package:flutter/material.dart';
import 'package:spark_otopark/SlideTransition.dart';
import 'package:spark_otopark/main.dart';



class SignIn extends StatefulWidget {
  int counter;
  SignIn({this.counter});
  @override
  _SignInState createState() => _SignInState(counter);
}

class _SignInState extends State<SignIn> {
  int counter;
  _SignInState(this.counter);
  String email = "";
  String password = "";
  String error ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          elevation: 0.0,
          title: Text("Spark'a Hoşgeldin"),
          actions:<Widget> [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Kayıt Ol"),
              onPressed: (){
              },
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
              child: Form(
                  child: Column(
                    children:<Widget> [
                      SizedBox(height: 20.0,),
                      Image.asset(
                        'images/spark.png',
                        width: 300,
                        height: 150,
                        fit: BoxFit.cover,


                      ),

                      SizedBox(height: 50.0,),
                      TextFormField(
                        decoration :InputDecoration(
                          labelText: "Emailinizi girin",
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.mail,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),

                        validator: (val) => val.isEmpty? "Emailinizi girin." : null,
                        onChanged: (val){
                          setState(() =>email = val );

                        },
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                        decoration :InputDecoration(
                          labelText: "Şifrenizi girin",
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.lock,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ) ,
                        obscureText: true,
                        validator: (val) => val.length<6 ? "6 karakterden daha uzun bir şifre girin" : null,
                        onChanged: (val){
                          setState(() =>password = val );
                        },
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.teal,
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: ()async{
                          Navigator.push(context,SlideTopRoute(page: MyHomePage(title: "'Spark Otopark Giriş !",counter: counter,)));
                        },
                      ),

                      Text(
                        error,
                        style: TextStyle(color:Colors.red),
                      ),

                    ],
                  )
              ),
            ),

          ],
        )

    );
  }
}
