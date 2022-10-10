// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'characteristic.g.dart';

@JsonSerializable()
class Characteristics {
  Characteristics({
    this.habitat,
    this.averageLitterSize,
    this.color,
    this.lifespan,
    this.weight,
    this.type,
    this.skinType,
    this.lifestyle,
    this.favoriteFood,
    this.mainPrey,
    this.topSpeed,
    this.diet,
    this.slogan,
    this.litterSize,
    this.ageOfSexualMaturity,
    this.numberOfSpecies,
    this.ageOfWeaning,
    this.nameOfYoung,
    this.gestationPeriod,
    this.commonName,
    this.mostDistinctiveFeature,
    this.predators,
    this.groupBehavior,
    this.estimatedPopulationSize,
    this.length,
    this.biggestThreat,
    this.otherNameS,
    this.location,
    this.distinctiveFeature,
    this.height,
    this.prey,
    this.group,
  });

  String? habitat;
  String? averageLitterSize;
  String? color;
  String? lifespan;
  String? weight;
  String? type;
  dynamic skinType;
  String? lifestyle;
  String? favoriteFood;
  String? mainPrey;
  String? topSpeed;
  dynamic diet;
  String? slogan;
  String? litterSize;
  String? ageOfSexualMaturity;
  String? numberOfSpecies;
  String? ageOfWeaning;
  String? nameOfYoung;
  String? gestationPeriod;
  String? commonName;
  String? mostDistinctiveFeature;
  String? predators;
  String? groupBehavior;
  String? estimatedPopulationSize;
  String? length;
  String? biggestThreat;
  String? otherNameS;
  String? location;
  String? distinctiveFeature;
  String? height;
  String? prey;
  String? group;
  factory Characteristics.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicsFromJson(json);

  Map<String, dynamic> toJson() => _$CharacteristicsToJson(this);
}
