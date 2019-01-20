import 'package:meta/meta.dart';
import 'package:spartan_foods/enum/query/QueryFilterDisplay.dart';
import 'package:spartan_foods/models/serializable/ISerializable.dart';

abstract class QueryFilter<T> extends ISerializable<T> {
  final String name;
  final QueryFilterDisplay display;

  QueryFilter({
    @required this.name,
    @required this.display
  }) {}
}