import 'package:spartan_foods/models/dining_halls/dining-hall-hours.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dining-hall.g.dart';

@JsonSerializable()
class DiningHall {
  final String hallName;
  final String brandName;
  final String fullName;
  final String searchName;
  @JsonKey(ignore: true)
  final Map<String, List<DiningHallHours>> hours;

  DiningHall({
    this.hallName,
    this.brandName,
    this.fullName,
    this.searchName,
    this.hours
  });

  factory DiningHall.fromJson(Map<String, dynamic> json) => _$DiningHallFromJson(json);
  Map<String, dynamic> toJson() => _$DiningHallToJson(this);
}