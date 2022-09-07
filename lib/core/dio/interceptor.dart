// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../settings.dart';
import '../../utils/utils.dart';
import '../firebase/remote_config/remote_config_custom.dart';

class Interceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final user = Settings.user;
    String deviceid = '';
    String token = '';

    if (user != null) {
      try {
    
        deviceid = EncryptService().encrypt(user.id!);

        if (options.headers.containsKey('requiresToken')) {
          options.headers.remove("requiresToken");
          final prefs = await SharedPreferences.getInstance();
          final configTokenName = RemoteConfigCustom().getValueOrDefault(
            key: 'tokenName',
            defaultValue: Settings.tokenName,
          );
          token = prefs.getString(configTokenName) ?? '';
        }

        options.headers.addAll({
          "authorization": 'Bearer $token',
          "deviceid": deviceid,
        });
      } catch (e) {
        return handler.reject(DioError(
          requestOptions: options,
          error: e,
        ));
      }
    }

    options.connectTimeout = 8000; //8s
    options.receiveTimeout = 5000; //5s

    handler.next(options);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   if (err.response?.statusCode == 401) {
  //     Get.offNamed('/login');
  //   }
  //   handler.next(err);
  // }
}
