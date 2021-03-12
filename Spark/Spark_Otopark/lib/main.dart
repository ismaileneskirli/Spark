import 'package:flutter/material.dart';
import 'package:spark_otopark/MainDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spark Otopark',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Spark Otopark Giriş !',counter: 0,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.counter}) : super(key: key);

  int counter=0;
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(counter);
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  _MyHomePageState(this.counter);


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      counter++;
    });
  }
  var _controller = TextEditingController();
  var _controllerX = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MainDrawer(counter : counter),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller:_controller,
              decoration: InputDecoration(
                hintText: "Giriş yapan aracın plakasını giriniz.",
                suffixIcon: IconButton(
                  onPressed: ()=> _controller.clear(),
                  icon: Icon(Icons.clear),
                )
              ),
              onSubmitted: (String str){
                setState(() {
                  counter++;
                  _controller.clear();
                });
              },
            ),
            SizedBox(height: 30,),
            TextField(
              controller:_controllerX,
              decoration: InputDecoration(
                  hintText: "Çıkış yapan aracın plakasını giriniz.",
                  suffixIcon: IconButton(
                    onPressed: ()=> _controllerX.clear(),
                    icon: Icon(Icons.clear),
                  )
              ),
              onSubmitted: (String str){
                setState(() {
                  _controllerX.clear();
                });
              },
            ),
            SizedBox(height: 30,),
            Row(
              children:<Widget> [
                Text("Otoparkınızın Doluluk oranı :"),
                SizedBox(width: 10,),
                Text(
                  '$counter/45',
                  style: Theme.of(context).textTheme.headline4,
                ),

              ],
            )

          ],
        ),
      )
      );
  }
}

