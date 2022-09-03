import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class RemoteConfigCustom {
  late FirebaseRemoteConfig firebaseRemoteConfig;

  RemoteConfigCustom._internal();
  static final RemoteConfigCustom _singleton = RemoteConfigCustom._internal();
  factory RemoteConfigCustom() => _singleton;

  Future<void> initialize() async {
    firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    await firebaseRemoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
  }

  Future<void> forceFetch() async {
    try {
      await firebaseRemoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await firebaseRemoteConfig.fetchAndActivate();
    } on PlatformException catch (e) {
      throw (e.toString());
    } catch (e) {
      throw ('Error fetching remote config: $e');
    }
  }

   getValueOrDefault({
    required String key,
    required dynamic defaultValue,
  }) {
    switch (defaultValue.runtimeType) {
      case String:
        var value = firebaseRemoteConfig.getString(key);
        return value != '' ? value : defaultValue;
      case int:
        var value = firebaseRemoteConfig.getInt(key);
        return value != 0 ? value : defaultValue;
      case bool:
        var value = firebaseRemoteConfig.getBool(key);
        return value != false ? value : defaultValue;
      case double:
        var value = firebaseRemoteConfig.getDouble(key);
        return value != 0.0 ? value : defaultValue;

      default:
        return Exception('Invalid type');
    }
  }
}
