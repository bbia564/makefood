import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dart:core';
import '../../db/db_service.dart';
import '../home/home_controller.dart';

class AddFoodDiaryController extends GetxController {
  static AddFoodDiaryController get to => Get.find<AddFoodDiaryController>();
  final db = Get.find<DatabaseService>();
  TextEditingController titleC = TextEditingController();

  List<TextEditingController> inputTextControllers = [];
  List<File> images = [];

  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');

  add() async {
    if (images.isEmpty) {
      EasyLoading.showToast("Please select an image.");
      return;
    }
    if (titleC.text.isEmpty) {
      EasyLoading.showToast("Please enter a title.");
      return;
    }
    if (inputTextControllers.isEmpty) {
      EasyLoading.showToast("Please enter the steps.");
      return;
    }
    if (inputTextControllers[0].text.isEmpty) {
      EasyLoading.showToast("Please enter the steps.");
      return;
    }

    EasyLoading.show();
    List<String> imagesPath = [];
    await Future.wait(images.map((v) async {
      DateTime today = DateTime.now();
      // String fileName =
      //     '${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}/'
      //     '${AppUtil.randomLetters(10)}${DateTime.now().millisecondsSinceEpoch}.png';
      // var path = await saveImageToFile(v, fileName);
      imagesPath.add(v.path);
    }));
    List<String> inputTexts = [];
    for (var v in inputTextControllers) {
      if (v.text.isNotEmpty) {
        inputTexts.add(v.text);
      }
    }

    await db.addRecord(titleC.text, imagesPath.join(','), inputTexts.join("#"),
        formatterDay.format(DateTime.now()));
    HomeController.to.initData();
    Future.delayed(const Duration(seconds: 1)).then((v) {
      EasyLoading.dismiss();
      Get.back();
    });
  }

// Future<String> saveImageToFile(File sfile, String imageName) async {
//   debugPrint(sfile.path);
//   final directory = await getApplicationDocumentsDirectory();
//   Directory newDirectory = Directory('${directory.path}/images');
//   if (!newDirectory.existsSync()) {
//     newDirectory.createSync(recursive: true);
//   }
//   final filePath = '${newDirectory.path}/$imageName';
//   final file = File(filePath);
//   Uint8List imageBytes = await sfile.readAsBytes();
//   await file.writeAsBytes(imageBytes);
//   return filePath; // 返回文件路径
// }
}
