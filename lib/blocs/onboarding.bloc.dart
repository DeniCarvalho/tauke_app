import 'package:flutter/widgets.dart';
import '../models/models.dart';
import '../repositories/shared.repository.dart';
import '../repositories/user.repository.dart';

class OnboardingBloc extends ChangeNotifier {
  final sharedRepository = SharedRepository();
  final userRepository = UserRepository();

  late List<CountryModel> countries;
  late CountryModel selectedCountry = CountryModel(
    name: "Brasil",
    code: "BR",
    ddi: "+55",
  );

  OnboardingBloc() {
    getCountries();
  }

  getCountries() async {
    countries = await sharedRepository.getAllCountries();
    notifyListeners();
  }

  changeCountry(CountryModel country) {
    selectedCountry = country;
    notifyListeners();
  }
}
