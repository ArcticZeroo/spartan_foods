// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_result_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodResultItem _$FoodResultItemFromJson(Map<String, dynamic> json) {
  return FoodResultItem(
      name: json['name'] as String,
      venue: json['venue'] as String,
      diningHall: json['diningHall'] as String,
      isVegetarian: json['isVegetarian'] as bool,
      isVegan: json['isVegan'] as bool,
      isGlutenFree: json['isGlutenFree'] as bool,
      preferences:
          (json['preferences'] as List)?.map((e) => e as String)?.toList(),
      allergens: (json['allergens'] as List)?.map((e) => e as String)?.toList(),
      meal: json['meal'] as int,
      formattedDate: json['formattedDate'] as String);
}

Map<String, dynamic> _$FoodResultItemToJson(FoodResultItem instance) =>
    <String, dynamic>{
      'name': instance.name,
      'venue': instance.venue,
      'diningHall': instance.diningHall,
      'isVegetarian': instance.isVegetarian,
      'isVegan': instance.isVegan,
      'isGlutenFree': instance.isGlutenFree,
      'preferences': instance.preferences,
      'allergens': instance.allergens,
      'meal': instance.meal,
      'formattedDate': instance.formattedDate
    };
