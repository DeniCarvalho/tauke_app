import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/shared/shared.dart';

class FailureModel {
  late String title;
  late String code;
  late String description;
  late dynamic data;

  FailureModel({
    required this.title,
    required this.code,
    required this.description,
    this.data,
  });

  FailureModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? 'Oops';
    code = json['code'] ?? '500';
    description =
        json['description'] ?? 'Ocorreu um erro. Tente novamente mais tarde.';
    data = json['data'];
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
