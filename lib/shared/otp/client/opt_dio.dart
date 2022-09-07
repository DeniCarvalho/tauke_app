import 'package:dio/native_imp.dart';

import '../../../core/core.dart';
import '../../../settings.dart';

class OTPDio extends DioForNative {
  OTPDio() {
    final baseUrl = RemoteConfigCustom().getValueOrDefault(
      key: 'apiUrl',
      defaultValue: Settings.apiUrl,
    );
    options.baseUrl = baseUrl;
    interceptors.add(Interceptor());
  }
}
