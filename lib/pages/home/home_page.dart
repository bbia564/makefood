import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_diary/pages/home/weidget/item.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.mediaQueryPadding.top + 20),
              child: Center(
                child: Text(
                  "Meal Journal",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(child: Obx(() => _buildListView()))
          ],
        ),
      ],
    );
  }

  Widget _buildListView() {
    if (controller.list.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/ic_tip.png",
              width: 64,
            ),
            15.verticalSpace,
            Text(
              "Click the${" + "}icon below to record",
              style: TextStyle(fontSize: 14.sp, color: const Color(0xFF0F0F0F).withOpacity(0.3)),
            )
          ],
        ),
      );
    }
    return ListView.separated(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 18),
      shrinkWrap: true,
      itemCount: controller.list.length,
      itemBuilder: (context, index) {
        final bean = controller.list[index];
        return InkWell(
            onTap: () {
              Get.toNamed('/details', arguments: {"food": bean});
            },
            child: HomeItem(
              foodBean: bean,
            ));
      },
      separatorBuilder: (BuildContext context, int index) {
        return 12.verticalSpace;
      },
    );
  }
}
