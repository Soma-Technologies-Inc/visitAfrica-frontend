import 'package:visistafri/models/mostVisited.models.dart';
import 'package:visistafri/repostory/data.dart';

class Repositroy {
  MostVisted getItemsByCountryAndCategory(String location, String category) {
    var t = mostVisitedCategories.where((element) {
      if (element.name == category) {
        element.places =
            element.places.where((item) => item.location == location).toList();
        return element.places.isNotEmpty;
      }
      return false;
    }).toList();
    return t.isNotEmpty ? t[0] : null;
  }
}