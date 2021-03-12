class Struct{
  String title,subtitle;
  double rating;
  String price;
  String doluluk;
  String distance;

  Struct(this.title,this.subtitle,this.rating,this.price,this.doluluk,this.distance);

}

List recentList = [
  new Struct('Üsküdar Belediyesi Yeraltı', 'Çavuşdere Cd. No:35', 3 , '10', "Doluluk:25/40","Uzaklık:3km"),
  new Struct('Park İstanbul Otopark', 'Üsküdar Harem Sahil Yolu No:64', 2.5, '20',"Doluluk:10/30","Uzaklık:3.5 km"),
  new Struct('Empark Katibim', 'Abdülfeyyaz Sokağı No:4', 4 , '8',"Doluluk:25/101","Uzaklık:4km"),
  new Struct(' İcadiye Açık Otoparkı', 'Oymacı Sk. No:30 D:66', 3.5 , '15',"Doluluk:92/150","Uzaklık:8km"),
  new Struct('Kuzguncuk Otoparkı', 'İcadiye Cd. No: 62', 4, '25',"Doluluk:48/102","Uzaklık:11.5 km"),
  new Struct('Afm Yediemin Otopark', 'İcadiye Bağlarbaşı Cd. No:40', 3 , '12',"Doluluk:43/73","Uzaklık:13.8 km"),
];