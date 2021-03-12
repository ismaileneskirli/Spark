import 'package:flutter/material.dart';
import 'package:gsu_park/Widget/Rating.dart';
import 'package:gsu_park/helper/fake_data.dart';
import 'package:gsu_park/Transitions/SlideTransition.dart';
import 'package:gsu_park/screens/payment.dart';
import 'package:gsu_park/Widget/BottomSheet.dart';

class Recents extends StatefulWidget{

  @override
  State createState() => _RecentState();
}

class _RecentState extends State<Recents> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: recentList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0,horizontal: 24),
              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 6,
                  color: Colors.blueGrey.withOpacity(0.8),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                  Navigator.push(context, SlideTopRoute(page: MyPaymentPage()));
                  },
                          title: Text(
                            '${recentList[index].title}',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 17.5,
                                letterSpacing: 0.2
                            ),
                          ),
                          subtitle: Text(
                            '${recentList[index].subtitle}',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.5,
                                letterSpacing: 0.1

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: StarRating(
                                  size: 16,
                                  color: Colors.yellow[600],
                                  rating: recentList[index].rating,
                                ),
                              ),
                              Container(
                                child:Text(
                                  '${recentList[index].doluluk}',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.5,
                                      letterSpacing: 0.1

                                  ),
                                ) ,
                              ),
                              Container(
                                child:Text(
                                  '${recentList[index].distance}',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13.5,
                                      letterSpacing: 0.1

                                  ),
                                ) ,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Text(
                                  ' ${recentList[index].price} ₺',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            );
          }
      ),
    );
  }

}