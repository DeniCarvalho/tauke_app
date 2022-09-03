import 'package:encrypt/encrypt.dart';
import 'package:taukeflow/settings.dart';

import '../core/firebase/firebase.dart';
import '../models/models.dart';

class SharedRepository {
  // Send coide for sms
  Future<void> sendCodeSMS() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final user = Settings.user;
      if (user == null) {
        throw Exception('User not found');
      }
      // await RemoteConfigCustom().forceFetch();
      final configEncryptKey = RemoteConfigCustom().getValueOrDefault(
        key: 'encryptKey',
        defaultValue: Settings.encryptKey,
      );

      final configEncryptIV = RemoteConfigCustom().getValueOrDefault(
        key: 'encryptIV',
        defaultValue: Settings.encryptIV,
      );

      final encrypter =
          Encrypter(AES(Key.fromUtf8(configEncryptKey), mode: AESMode.cbc));
      final deviceEncrypted =
          encrypter.encrypt(user.id, iv: IV.fromUtf8(configEncryptIV));
      print(deviceEncrypted.base64);
    } catch (e) {
      String message = 'Erro interno';
      throw FailureModel(
        title: 'Opps!',
        code: '500',
        description: message,
      );
    }
  }

  // Send code for email
  Future<void> sendCodeEmail() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  // Validate code
  Future<void> validateCode(String code) async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
