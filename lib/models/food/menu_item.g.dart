// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuItem _$MenuItemFromJson(Map<String, dynamic> json) {
  return MenuItem(
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

Map<String, dynamic> _$MenuItemToJson(MenuItem instance) =>
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
