import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate <String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(icon:
      Icon(Icons.clear), onPressed: (){
        query ="";
      })
    ];
  }
  final Parks = [
    "Beşiktaş Otopark",
    "Ümraniye Otopark",
    "Uskudar Otopark",
    "Ortaköy Otopark",
    "Kadıköy Otopark"
  ];
  final recentParks = [
    "Ümraniye Otopark",
    "Uskudar Otopark"
  ];

  @override
  Widget buildLeading(BuildContext context) {

    // leading icon on the left  of the app bar
    return IconButton(
      icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ),
    onPressed:(){
        close(context, null);
  });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
  return Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Card(
      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25.0,
        ),
        title: Text(query),
      ),
    ),
  );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone seaches for sth
    final suggestionList = query.isEmpty?recentParks:Parks.where((p) => p.startsWith(query)).toList();
    return  ListView.builder(
      itemBuilder: (context,index) => ListTile(
        onTap:(){
          showResults(context);
        },//arama yapıldıktan sonra çıkan yere basıldığında ne olsun
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(color: Colors.grey))
          ]),
      ),
      ),
      itemCount: suggestionList.length,
    );
  }
}