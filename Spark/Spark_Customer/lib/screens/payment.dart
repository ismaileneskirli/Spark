import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gsu_park/Transitions/ScaleTransition.dart';
import 'package:gsu_park/screens/recipt.dart';
import 'package:gsu_park/screens/home/CustomPaintHome.dart';
import  'package:gsu_park/screens/yorum.dart';

class MyPaymentPage extends StatefulWidget{

  @override
  State createState() => _MyPaymentPageState();
}

class _MyPaymentPageState extends State<MyPaymentPage> {


  List _paymentMethod = ['Cüzdanım' , 'Varsayılan Kredi Kartım' ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context,true);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 22,
                ),
              ),

              SizedBox(height: 24,),
              Text(
                'Üsküdar Belediyesi Yeraltı',
                style: TextStyle(
                  color: Colors.teal[800],
                  fontSize: 34.4,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),

              SizedBox(height: 6,),
              Text(
                'Çavuşdere Cd. No:35',
                style: TextStyle(
                  //color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 6,),
              Center(
                child: Image.asset(
                  'images/garage.jpg',
                  width: 350,
                  height: 200,
                  fit: BoxFit.cover,


                ),
              ),

              SizedBox(height: 20,),
              Text(
                'Park Zamanı',
                style: TextStyle(
                  // color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                    fontSize: 15
                ),
              ),

              SizedBox(height: 12,),
              SizedBox(
                height: 104,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          color: Colors.teal[700],
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            width: 134,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${index+1} saat',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        letterSpacing: 0.1

                                    ),
                                  ),
                                  SizedBox(height: 6,),
                                  Text(
                                    '${index*5 + 10} ₺',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),




              SizedBox(height: 10,),



              SizedBox(height: 20,),
              Text(
                'Ödeme Türü',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    //color: Colors.white,
                    fontSize: 15
                ),
              ),
              SizedBox(height: 12,),
              SizedBox(
                height: 104,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          color: Colors.indigo.withBlue(900),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Container(
                            width: 134,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '${_paymentMethod[index]}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        letterSpacing: 0.1,
                                        color: Colors.white

                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ),
              SizedBox(height: 30,),
              Text(
                'Aylık Üyelik : 200 ₺',
                style: TextStyle(
                    //color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Vale Hizmeti : Var',
                style: TextStyle(
                   // color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: Yorum()));
                    },
                    color: Colors.black87,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Yorumlar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 4,
                          letterSpacing: 0.3
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
              ),




              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 24.0,left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Toplam : ',
                      style: TextStyle(
                          //color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.4,
                          letterSpacing: 0.2
                      ),
                    ),
                    Text(
                      '15 ₺ ',
                      style: TextStyle(
                         // color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.2
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    onPressed: (){
                      Navigator.push(context, ScaleRoute(page: MyRecipt()));
                    },
                    color: Colors.black87,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Text(
                      'Ödeme Yap',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          wordSpacing: 4,
                          letterSpacing: 0.3
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}