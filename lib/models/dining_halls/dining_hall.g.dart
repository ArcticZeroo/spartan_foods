// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dining_hall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiningHall _$DiningHallFromJson(Map<String, dynamic> json) {
  return DiningHall(
      hallName: json['hallName'] as String,
      brandName: json['brandName'] as String,
      fullName: json['fullName'] as String,
      searchName: json['searchName'] as String);
}

Map<String, dynamic> _$DiningHallToJson(DiningHall instance) =>
    <String, dynamic>{
      'hallName': instance.hallName,
      'brandName': instance.brandName,
      'fullName': instance.fullName,
      'searchName': instance.searchName
    };
