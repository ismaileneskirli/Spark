import 'package:flutter/material.dart';
import 'package:gsu_park/services/auth.dart';

 class SignIn extends StatefulWidget {
   final Function toggleView;
   SignIn({this.toggleView});
   @override
   _SignInState createState() => _SignInState();
 }
 
 class _SignInState extends State<SignIn> {

   final AuthService _auth = AuthService();
   final _formKey = GlobalKey <FormState>();
   // text field state

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
           title: Text("Spark'a Hoşgeldin"),
         actions:<Widget> [
           FlatButton.icon(
             icon: Icon(Icons.person),
             label: Text("Kayıt Ol"),
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
                    color: Colors.blue,
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: ()async{
                      if(_formKey.currentState.validate()){
                        dynamic result = await  _auth.signInWithEmailandPassword(email.trim(), password);

                      if( result == null){
                        setState(() {
                          error ="Girmiş olduğunuz şifre veya email yanlıştır.";
                        });
                      }
                    }
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
             Container(
               padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 25.0),
               child:RaisedButton(
                 color: Colors.blue ,
                 child: Text(
                   "Anonim olarak giriş yapın",
                   style: TextStyle(
                       color:  Colors.white
                   ),
                 ),
                 onPressed: () async{
                   dynamic result = await _auth.signInAnon();
                   if( result == null){
                     print("Hata : Giriş Yapılamadı");
                   }
                   else{
                     print("signed in");
                     print(result.uid);
                   }
                 },
               ) ,

             ),
           ],
         )

     );
   }
 }
 