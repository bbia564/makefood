import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_diary/pages/details/controller.dart';
import 'package:food_diary/res/style.dart';
import 'package:get/get.dart';

class DetailsPagePage extends GetView<DetailsController> {
  const DetailsPagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 169,
                child: Swiper(
                  onIndexChanged: (value) {},
                  loop: false,
                  curve: Curves.linear,
                  itemCount: controller.bean.images.length,
                  pagination: SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white.withOpacity(0.33),
                        activeColor: Colors.white,
                        size: 7.0,
                        activeSize: 7.0),
                  ),
                  itemBuilder: (context, index) {
                    if(controller.bean.images[index].contains("assets")){
                      return Image.asset(
                        controller.bean.images[index],
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      );
                    }else{
                      return Image.file(
                        File(controller.bean.images[index]),
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: double.infinity,
                      );
                    }

                  },
                ),
              ),
            ),
            14.verticalSpace,
            Container(
              decoration: AppStyle.defDecoration,
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  14.verticalSpace,
                  Text(
                    controller.bean.name ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black),
                  ),
                  7.verticalSpace,
                  Text(
                    controller.bean.createdAt ?? "",
                    style:
                        TextStyle(fontSize: 14.sp, color: const Color(0xFF030303).withOpacity(0.4)),
                  ),
                  14.verticalSpace,
                  const Divider(
                    height: 1,
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.only(bottom: 40),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.bean.steps.length,
                      itemBuilder: (context, index) {
                        return _stepItem(index + 1, controller.bean.steps[index]);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _stepItem(int index, String step) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        12.verticalSpace,
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(color: Color(0xFFF5902C), shape: BoxShape.circle),
            ),
            10.horizontalSpace,
            Text(
              "Step $index",
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 16.sp, color: const Color(0xFF0F0F0F)),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Text(
            step,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: const Color(0xFF0F0F0F).withOpacity(0.6)),
          ),
        )
      ],
    );
  }
}
