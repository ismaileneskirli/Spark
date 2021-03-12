import 'package:flutter/material.dart';
import 'package:gsu_park/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey <FormState>();
  //text field state
  String email = "";
  String password = "";
  String error ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue[400],
          elevation: 0.0,
          title: Text("Sparka Kayıt Ol"),
          actions:<Widget> [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text("Giriş Yap"),
              onPressed: (){
                widget.toggleView();

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
                key: _formKey,
                  child: Column(
                    children:<Widget> [
                      SizedBox(height: 20.0,),
                      Image.asset(
                        'images/spark.png',
                        width: 300,
                        height: 150,
                        fit: BoxFit.cover,


                      ),
                  SizedBox(height: 50,),
                      TextFormField(
                        decoration :InputDecoration(
                        labelText: "Emailinizi Girin",
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
                        validator: (val) => val.isEmpty? "Emailinizi Girin" : null,
                        onChanged: (val){
                          setState(() =>email = val );

                        },
                      ),
                      SizedBox(height: 20.0,),
                      TextFormField(
                          decoration :InputDecoration(
                            labelText: "Şifrenizi Girin",
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
                        color: Colors.blue,
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: ()async{
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.registerWithEmailandPassword(email.trim(), password);
                            if( result == null){
                              setState(() {
                                error =" Geçerli bir email adresi girin.";
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        error,
                        style: TextStyle(color:Colors.red),
                      )
                    ],
                  )
              ),
            )

          ],
        )

    );
  }
}
