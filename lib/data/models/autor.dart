import './address.dart';
import './geo_location.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final GeoLocation geo;

  const User({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.geo,
  });

  factory User.fromJson(json) {
    return User(
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
        lat: json['geo']['lat'],
        lng: json['geo']['lng'],
      ),
    );
  }
}
