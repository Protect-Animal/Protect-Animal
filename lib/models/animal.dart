import 'package:protectanimal/models/characteristic.dart';
import 'package:protectanimal/models/coordinates.dart';

import 'package:json_annotation/json_annotation.dart';

part 'animal.g.dart';

@JsonSerializable(explicitToJson: true)
class Animal {
  Animal({
    required this.locations,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    this.characteristics,
    required this.id,
    required this.name,
    required this.coordinates,
  });

  List<String> locations;
  List<String> image;
  DateTime updatedAt;
  DateTime createdAt;
  Characteristics? characteristics;
  String id;
  String name;
  Coordinates coordinates;
  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}
