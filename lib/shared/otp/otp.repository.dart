import 'package:dio/dio.dart';
import '../../core/core.dart';

abstract class OTPRepository {
  Future<void> sendCodeSMS(String phone);
  Future<void> sendCodeEmail(String email);
  Future<void> validateCode(String code);
}

class OTPRepositoryImpl implements OTPRepository {
  final Dio client;

  OTPRepositoryImpl({
    required this.client,
  });

  @override
  Future<void> sendCodeEmail(String email) async {
    try {
      await client.post(
        '/otps/generate',
        data: {
          "data": {"type": "email", "identifier": email}
        },
      );
    } catch (e) {
      String message = 'Erro interno';
      throw Failure(
        title: 'Opps!',
        code: '500',
        description: message,
      );
    }
  }

  @override
  Future<void> sendCodeSMS(String phone) async {
    try {
      await client.post(
        '/otps/generate',
        data: {
          "data": {"type": "sms", "identifier": phone}
        },
      );
    } on DioError catch (dioErr) {
      throw Failure.fromDio(dioErr);
    } catch (e) {
      throw Failure.fromJson();
    }
  }

  @override
  Future<void> validateCode(String code) async {
    try {
      await client.post(
        '/otps/validate',
        data: {
          "data": {"code": code}
        },
      );
    } catch (e) {
      String message = 'Erro interno';
      throw Failure(
        title: 'Opps!',
        code: '500',
        description: message,
      );
    }
  }
}
