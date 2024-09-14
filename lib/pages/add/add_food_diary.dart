import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_diary/pages/add/widget/add_step_widget.dart';
import 'package:food_diary/pages/add/widget/select_image_widget.dart';
import 'package:get/get.dart';

import '../../res/style.dart';
import 'aadd_controller.dart';

class AddFoodDiary extends GetView<AddFoodDiaryController> {
  const AddFoodDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: AppStyle.defDecoration,
              padding: REdgeInsets.all(8),
              margin: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SelectImageWidget(
                maxLength: 3,
                selectCallback: (List<File> files) {
                  controller.images.clear();
                  controller.images.addAll(files);
                },
              ),
            ),
            Container(
              decoration: AppStyle.defDecoration,
              margin: REdgeInsets.symmetric(horizontal: 16),
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6, top: 12),
                    child: Text("Food Title",
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF0F0F0F),
                            fontWeight: FontWeight.w500)),
                  ),
                  TextField(
                    controller: controller.titleC,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Input Title",
                        hintStyle: TextStyle(
                            fontSize: 12.sp, color: const Color(0xFF0F0F0F).withOpacity(0.3))),
                  ),
                  const Divider(),
                  AddStepWidget(
                    textList: (List<TextEditingController> value) {
                      controller.inputTextControllers = value;
                    },
                  ),
                  50.verticalSpace,
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 47,
              margin: REdgeInsets.symmetric(horizontal: 16, vertical: 25),
              child: ElevatedButton(
                onPressed: () {
                  controller.add();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color(0xFFF5902C),
                    // 设置边框颜色和宽度
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    // 设置边框颜色和宽度
                  ),
                ),
                child: Text(
                  "Submit",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
