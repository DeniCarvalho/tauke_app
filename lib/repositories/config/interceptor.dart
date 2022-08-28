import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../settings.dart';

class InterceptorDio {
  Future<Dio> auth() async {
    final user = Settings.user;
    String deviceid = '';
    if (user != null) {
      final encrypter =
          Encrypter(AES(Key.fromUtf8(Settings.encryptKey), mode: AESMode.cbc));
      final deviceEncrypted =
          encrypter.encrypt(user.id, iv: IV.fromUtf8(Settings.encryptIV));
      deviceid = deviceEncrypted.base64;
    }

    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Settings.tokenName) ?? '';

    var dio = Dio();
    dio.options.headers = {
      "authorization": 'Bearer $token',
      "deviceid": deviceid
    };
    dio.options.connectTimeout = 8000; //8s
    dio.options.receiveTimeout = 5000; //5s
    dio.interceptors.add(LogInterceptor(responseBody: false));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onResponse: (response, handler) {
      return handler.next(response);
    }, onError: (DioError e, handler) {
      if (e.response?.statusCode == 401) {
        Get.offNamed('/onboarding/intro');
      }
      return handler.next(e);
    }));
    return dio;
  }
}
