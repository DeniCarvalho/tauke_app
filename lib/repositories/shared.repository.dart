import '../models/country.model.dart';
import '../utils/constants/countries.const.dart';

class SharedRepository {
  // List all countries
  Future<List<CountryModel>> getAllCountries() async {
    List<Map<String, String>> jsonList = countries;

    List<CountryModel> items =
        jsonList.map((json) => CountryModel.fromJson(json)).toList();

    return items;
  }
}
