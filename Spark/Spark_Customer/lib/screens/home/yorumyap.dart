import 'package:flutter/material.dart';
import 'package:gsu_park/Transitions/ScaleTransition.dart';
import 'package:gsu_park/screens/home/home.dart';
class Yorumyap extends StatefulWidget {
  @override
  _YorumyapState createState() => _YorumyapState();
}

class _YorumyapState extends State<Yorumyap> {
  @override
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }
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
                TextField(
                  decoration: InputDecoration(
                    hintText: "Yorum yapın."
                  ),
                  controller: _controller,
                  onSubmitted: (String value) async {
                    await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Yorumunuz için teşekkür ederiz.'),
                          content: Text('Görüşleriniz bizim için değerlidir'),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.push(context, ScaleRoute(page: Home()));
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

        )
    );
  }
}
