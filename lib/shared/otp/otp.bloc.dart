import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/core.dart';
import 'client/client.dart';
import 'otp.repository.dart';

class OTPBloc extends ChangeNotifier {
  final client = OTPDio();
  late final repository = OTPRepositoryImpl(client: client);

  late bool loading = false;
  late String codeSms = '';
  late String error = '';

  bool get hasError => error.isNotEmpty;

  sendCode(String phone) async {
    try {
      update(loading: true);
      await repository.sendCodeSMS(phone);
      await Get.toNamed('/onboarding/phone/validate');
    } on Failure catch (e) {
      e.showMessage();
    } finally {
      update(loading: false);
    }
  }

  void update({
    bool? loading,
    String? codeSms,
    String? error,
  }) {
    this.loading = loading ?? this.loading;
    this.codeSms = codeSms ?? this.codeSms;
    this.error = error ?? this.error;
    notifyListeners();
  }
}
