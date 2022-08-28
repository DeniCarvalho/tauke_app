import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import '../repositories/shared.repository.dart';
import '../repositories/user.repository.dart';

class OnboardingBloc extends ChangeNotifier {
  final sharedRepository = SharedRepository();
  final userRepository = UserRepository();

  late bool loading = false;
  late String codeSms = '';

  sendCode() async {
    try {
      loading = true;
      notifyListeners();
      await sharedRepository.sendCodeSMS();
      await Get.toNamed('/onboarding/phone/validate');
    } on FailureModel catch (e) {
      e.showMessage();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  validateCode(String code) {
    codeSms = code;
    notifyListeners();
  }
}
