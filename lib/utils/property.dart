


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
final dio = Dio();

Future<Property?> createproperty() async {
  final url = '';

  try {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return Property.fromJson(response.data);
    } else {
      print('${response.statusCode} : ${response.data.toString()}');
      return null;
    }
  } catch (error) {
    print(error);
  }
  return null;
}
final client = Dio();

Future<Property?> getData() async {
  final url = '';

  try {
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return Property.fromJson(response.data);
    } else {
      print('${response.statusCode} : ${response.data.toString()}');
      return null;
    }
  } catch (error) {
    print(error);
  }
  return null;
}

// _yourClass_ data = await getData();

class Property {

  String label;
  String name;
  String price;
  String location;
  String sqm;
  String review;
  String description;
  String frontImage;
  String ownerImage;
  List<String> images;

  Property( {
      required this.label,
      required this.name,
      required this.price,
      required this.sqm,
      required this.location,
      required this.review,
      required this.description,
      required this.frontImage,
      required this.ownerImage,
      required this.images, required Widget Property, required Object recommendedList, });



  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      recommendedList: Property,
      name: json['name'],
      label: json['label'],
      price: json['price'] ,
      sqm: json['sqm'],
      location: json['location'],
      review: json['review'],
      description: json['description'],
      frontImage: json['frontImage'] ,
      ownerImage: json['ownerImage'],
      images: json['images'], Property: Text("property"),
    );
  } Map<String, dynamic> toJson() => {
    'name': name,
    'email': label,
     'price': price,
      "sqm":sqm,
    "location": location,
    "review": review,
    "description" : description,
    "frontImage": frontImage,
    "ownerImage": ownerImage,
    "images" : images,

  };
  static List<Property> generateRecommended() {
    return [
      Property(
        label:   "SALE",
        name:  "North House",
        price: "3,500.00",
        location:  "Florida",
        sqm:  "3,700",
        review:  "4.0",
        description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
        frontImage:  "images/house_06.jpg",
        ownerImage:  "images/owner.jpg",
        images: [
          "images/kitchen.jpg",
          "images/bath_room.jpg",
          "images/swimming_pool.jpg",
          "images/bed_room.jpg",
          "images/living_room.jpg",
        ], Property: Text("smike"), recommendedList: "",
      ),
      Property(
        label:   "RENT",
        name:  "Simone House",
        price: "3,900.00",
        location:  "Florida",
        sqm:  "3,700",
        review: "4.4",
        description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
        frontImage:  "images/house_08.jpg",
        ownerImage:  "images/owner.jpg",
        images: [
          "images/kitchen.jpg",
          "images/bath_room.jpg",
          "images/swimming_pool.jpg",
          "images/bed_room.jpg",
          "images/living_room.jpg",
        ], Property: Text("man open up "), recommendedList: "",
      ),    ];
  }

  static List<Property> generateBestOffer() {
    return [
      Property(
        label:  "SALE",
        name: "Clinton Villa",
        price: "3,500.00",
        location: "Los Angeles",
        sqm: "2,456",
        review: "4.4",
        description:   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
        frontImage: "images/house_01.jpg",
        ownerImage: "images/owner.jpg",
        images:
        [
          "images/kitchen.jpg",
          "images/bath_room.jpg",
          "images/swimming_pool.jpg",
          "images/bed_room.jpg",
          "images/living_room.jpg",
        ], Property: Text("shot out loud"), recommendedList: "",
      ),
      Property(
        label:  "RENT",
        name: "Salu House",
        price:  "3,500.00",
        location: "Miami",
        sqm: "3,300",
        review: "4.6",
        description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
        frontImage:  "images/house_04.jpg",
        ownerImage:  "images/owner.jpg",
        images: [
          "images/kitchen.jpg",
          "images/bath_room.jpg",
          "images/swimming_pool.jpg",
          "images/bed_room.jpg",
          "images/living_room.jpg",
        ], Property: Text(" Text"), recommendedList: "",
      ),
    ];
  }
}

List<Property> getPropertyList(){
  return <Property>[
    Property(
      label:  "SALE",
      name: "Clinton Villa",
      price: "3,500.00",
      location: "Los Angeles",
      sqm: "2,456",
      review: "4.4",
      description:   "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
      frontImage: "images/house_01.jpg",
      ownerImage: "images/owner.jpg",
      images:
      [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("String"), recommendedList: "",
    ),
    Property(
     label:  "RENT",
     name: "Salu House",
     price:  "3,500.00",
     location: "Miami",
     sqm: "3,300",
     review: "4.6",
     description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
     frontImage:  "images/house_04.jpg",
     ownerImage:  "images/owner.jpg",
     images: [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("hope"), recommendedList: "",
    ),
    Property(
   label:   "RENT",
   name: "Hilton House",
   price:  "3,100.00",
   location: "California",
   sqm:  "2,100",
   review: "4.1",
   description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
   frontImage:  "images/house_02.jpg",
   ownerImage:  "images/owner.jpg",
     images: [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("uop"), recommendedList: "",
    ),
    Property(
    label:   "SALE",
    name:  "Ibe House",
    price:"4,500.00",
    location:  "Florida",
    sqm:  "4,100",
    review:  "4.5",
    description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    frontImage:  "images/house_03.jpg",
    ownerImage:  "images/owner.jpg",
     images: [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("dead"), recommendedList: "",
    ),
    Property(
    label:  "SALE",
    name: "Aventura",
    price: "5,200.00",
    location:  "New York",
    sqm: "3,100",
    review: "4.2",
    description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    frontImage:  "images/house_05.jpg",
    ownerImage:  "images/owner.jpg",
     images:  [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("loop"), recommendedList: "",
    ),
    Property(
    label:   "SALE",
    name:  "North House",
    price: "3,500.00",
    location:  "Florida",
    sqm:  "3,700",
    review:  "4.0",
    description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    frontImage:  "images/house_06.jpg",
    ownerImage:  "images/owner.jpg",
     images: [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("argument"), recommendedList: "",
    ),
    Property(
    label:  "RENT",
    name: "Rasmus Resident",
    price: "2,900.00",
    location:"Detroit",
    sqm:  "2,700",
    review:  "4.3",
    description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
    frontImage:  "images/house_07.jpg",
    ownerImage:  "images/owner.jpg",
    images:  [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("pip"), recommendedList: "",
    ),
    Property(
   label:   "RENT",
   name:  "Simone House",
   price: "3,900.00",
   location:  "Florida",
   sqm:  "3,700",
   review: "4.4",
   description: "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
   frontImage:  "images/house_08.jpg",
   ownerImage:  "images/owner.jpg",
     images: [
        "images/kitchen.jpg",
        "images/bath_room.jpg",
        "images/swimming_pool.jpg",
        "images/bed_room.jpg",
        "images/living_room.jpg",
      ], Property: Text("literally"), recommendedList: "",
    ),
  ];
}