class MenuQueryBuilder {
  final Map<String, dynamic> _values = {};

  MenuQueryBuilder substring(String value) {
    _values['name'] = value.toLowerCase();

    return this;
  }

  MenuQueryBuilder meal(int meal) {
    _values['meal'] = meal;

    return this;
  }

  MenuQueryBuilder meals(List<int> meals) {
    _values['meal'] = meals.join(',');

    return this;
  }

  MenuQueryBuilder boolean(String key, bool value) {
    _values[key] = value ? 'true' : 'false';

    return this;
  }

  String build() {
    List<String> queryPieces = [];

    for (var entry in _values.entries) {
      queryPieces.add('${entry.key}=${entry.value}');
    }

    return '?${queryPieces.join('&')}';
  }
}