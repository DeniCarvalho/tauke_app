import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/shared/shared.dart';

class Failure {
  late String title;
  late String code;
  late String description;
  late dynamic data;

  Failure({
    required this.title,
    required this.code,
    required this.description,
    this.data,
  });

  Failure.fromJson({Map<String, dynamic>? json}) {
    title = json?['title'] ?? 'Ops!';
    code = json?['code'] ?? '500';
    description =
        json?['description'] ?? 'Ocorreu um erro. Tente novamente mais tarde.';
    data = json?['data'];
  }

  Failure.fromDio(DioError err) {
    final dataResponse =
        err.response?.data != null && err.response?.data is Map
            ? err.response?.data
            : null;
    title = err.response?.statusMessage ?? 'Ops!';
    code = err.response?.statusCode?.toString() ?? '500';
    description = dataResponse?['error']?['message'] ??
        'Ocorreu um erro. Tente novamente mais tarde.';
    data = dataResponse?['error']?['data'];
  }

  void showMessage() {
    Get.snackbar(
      title,
      description,
      duration: const Duration(seconds: 5),
      colorText: Get.isDarkMode ? Colors.white : Colors.black,
      icon: const Icon(
        Icons.error,
        color: AppColors.danger,
        size: 30,
      ),
    );
  }
}
