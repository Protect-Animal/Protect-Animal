// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      locations:
          (json['locations'] as List<dynamic>).map((e) => e as String).toList(),
      image: (json['image'] as List<dynamic>).map((e) => e as String).toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      characteristics: json['characteristics'] == null
          ? null
          : Characteristics.fromJson(
              json['characteristics'] as Map<String, dynamic>),
      id: json['id'] as String,
      name: json['name'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'locations': instance.locations,
      'image': instance.image,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'characteristics': instance.characteristics?.toJson(),
      'id': instance.id,
      'name': instance.name,
      'coordinates': instance.coordinates.toJson(),
    };
