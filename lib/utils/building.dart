class building {
  late final String name;
  late final String brand;
   //late final String type;
 // late final int maxSpeed;
  late  final int electricity;
  late final String year;
  late final bool smarthome;
  late final double price;

  building({
    required this.name,
    required this.brand,
  //  required this.type,
    required this.electricity,
    //required this.horsePower,
    required this.year,
    required this.smarthome,
    required this.price,
  });

  static final build = [
    new building(
        name: "Jazz",
        brand: "studio flat",
        //type: "gas",
        electricity: 200,
        //horsePower: 83,
        year: "2001",
        smarthome: false,
        price: 2000.00),
    new building(
        name: "Citigo",
        brand: "big flat",
        //type: "gas",
        electricity: 200,
       // horsePower: 75,
        year: "2011",
        smarthome: false,
        price: 10840.00),
    new building(
        name: "Octavia Combi",
        brand: "apartment",
       // type: "diesel",
        electricity: 240,
        //horsePower: 149,
        year: "2016",
        smarthome: false,
        price: 32650.00),
    new building(
        name: "Rapid",
        brand: "villa",
       // type: "diesel",
        //maxSpeed: 240,
        electricity: 95,
        year: "2012",
        smarthome: false,
        price: 20190.00),
    new building(
        name: "Q2",
        brand: "building",
       // type: "gas",
       // maxSpeed: 280,
        electricity: 140,
        year: "2018",
        smarthome: false,
        price: 28000.00),
    new building(
        name: "Model 3",
        brand: "villa",
       // type: "electric",
        //maxSpeed: 280,
        electricity: 140,
        year: "2018",
        smarthome: true,
        price: 35000),
  ];
}