import 'package:visistafri/models/place.models.dart';
import 'package:visistafri/repostory/data.dart';

class Repositroy {
  MostVisted getItemsByCountryAndCategory(String location, String category) {
    var t = mostVisitedCategories.where((element) {
      if (element.name == category) {
        element.places =
            element.places.where((item) => item.location == location);
        return true;
      }
      return false;
    }).first;
    return t;
  }
}
