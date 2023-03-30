import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';


LatLng _$LatLngFromJson(Map<String, dynamic> json) => LatLng(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
);

Map<String, dynamic> _$LatLngToJson(LatLng instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
};

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
  coords: LatLng.fromJson(json['coords'] as Map<String, dynamic>),
  id: json['id'] as String,
  name: json['name'] as String,
  zoom: (json['zoom'] as num).toDouble(),
);

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
  'coords': instance.coords,
  'id': instance.id,
  'name': instance.name,
  'zoom': instance.zoom,
};

Office _$OfficeFromJson(Map<String, dynamic> json) => Office(
  address: json['address'] as String,
  id: json['id'] as String,
  image: json['image'] as String,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  name: json['name'] as String,
  phone: json['phone'] as String,
  region: json['region'] as String,
);

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
  'address': instance.address,
  'id': instance.id,
  'image': instance.image,
  'lat': instance.lat,
  'lng': instance.lng,
  'name': instance.name,
  'phone': instance.phone,
  'region': instance.region,
};

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
  offices: (json['offices'] as List<dynamic>)
      .map((e) => Office.fromJson(e as Map<String, dynamic>))
      .toList(),
  regions: (json['regions'] as List<dynamic>)
      .map((e) => Region.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
  'offices': instance.offices,
  'regions': instance.regions,
};

@JsonSerializable()
class LatLng {
  LatLng({
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Region {
  Region({
    required this.coords,
    required this.id,
    required this.name,
    required this.zoom,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);

  final LatLng coords;
  final String id;
  final String name;
  final double zoom;
}

@JsonSerializable()
class Office {
  Office({
    required this.address,
    required this.id,
    required this.image,
    required this.lat,
    required this.lng,
    required this.name,
    required this.phone,
    required this.region,
  });

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);

  final String address;
  final String id;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String region;
}

@JsonSerializable()
class Locations {
  Locations({
    required this.offices,
    required this.regions,
  });

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);
  Map<String, dynamic> toJson() => _$LocationsToJson(this);

  final List<Office> offices;
  final List<Region> regions;
}

Future<Locations> getGoogleOffices() async {
  const googleLocationsURL = 'https://about.google/static/data/locations.json';

  // Retrieve the locations of Google offices
  try {
    final response = await http.get(Uri.parse(googleLocationsURL));
    if (response.statusCode == 200) {
      return Locations.fromJson(
          json.decode(response.body) as Map<String, dynamic>);
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }

  // Fallback for when the above HTTP request fails.
  return Locations.fromJson(
    json.decode(
      await rootBundle.loadString('assets/locations.json'),
    ) as Map<String, dynamic>,
  );
}