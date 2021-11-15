import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snackBar({String? title, String? message}) {
  Get.snackbar(
    title ?? "Title",
    message ?? "Message",
    isDismissible: true,
    snackPosition: SnackPosition.BOTTOM,
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(8.0),
    backgroundColor: Theme.of(Get.context!).errorColor,
    colorText: Colors.white,
  );
}
