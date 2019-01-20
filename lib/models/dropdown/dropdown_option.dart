import 'package:meta/meta.dart';

class DropdownOption<T> {
  final String name;
  final T value;

  DropdownOption({@required this.name, @required this.value});
}
