import 'package:encrypt/encrypt.dart';

import '../../core/core.dart';

class EncryptService {
  static final EncryptService _singleton = EncryptService._internal();

  factory EncryptService() {
    return _singleton;
  }

  EncryptService._internal();

  String encrypt(String value, {String defaultKey = ''}) {
    final key = RemoteConfigCustom().getValueOrDefault(
      key: 'publicKey',
      defaultValue: defaultKey,
    );
    final encrypter = Encrypter(
      AES(
        Key.fromUtf8(key),
        mode: AESMode.cbc,
      ),
    );
    final encrypted = encrypter.encrypt(
      value,
      iv: IV.fromLength(16),
    );
    final valueEncrypted = encrypted.base64;
    return valueEncrypted;
  }

  String decrypt(String text) {
    return text;
  }
}
