abstract class FoodUtil {
  static final RegExp nameRegex = new RegExp(r'^(.+?)(?:\s+\(.+\))?$');
  static final RegExp cleanNamePattern = new RegExp(r'[^\w]');

  static String getCleanedName(String name) {
    if (!nameRegex.hasMatch(name)) {
      return null;
    }

    var match = nameRegex.firstMatch(name);

    if (match.groupCount < 1) {
      return null;
    }

    var matchedName = match.group(1);

    // Name With Spaces -> namewithspaces
    // Spencer's Name -> spencersname
    return matchedName.toLowerCase().replaceAll(cleanNamePattern, '');
  }
}