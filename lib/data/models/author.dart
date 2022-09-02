import 'dart:io';

import 'package:posts_reader/data/models/company.dart';

import './address.dart';
import './geo_location.dart';

class Author {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final GeoLocation geo;
  final String phone;
  final String website;
  final Company company;

  const Author({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.geo,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory Author.fromJson(json) {
    return Author(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address(
        street: json['address']['street'],
        suite: json['address']['suite'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
      ),
      geo: GeoLocation(
        lat: json['address']['geo']['lat'],
        lng: json['address']['geo']['lng'],
      ),
      phone: json['phone'],
      website: json['website'],
      company: Company(
          name: json['company']['name'],
          catchPhrase: json['company']['catchPhrase'],
          bs: json['company']['bs']),
    );
  }
}
