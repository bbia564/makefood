import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_diary/res/style.dart';

import '../../../entity/food_bean.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.foodBean});

  final FoodBean foodBean;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.defDecoration,
      padding: const EdgeInsets.all(9),
      child: Row(
        children: [
          foodBean.images[0].contains("assets")
              ? Container(
                  width: 134,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      foodBean.images[0],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                )
              : Container(
                  width: 134,
                  height: 110,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCCCCCC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(foodBean.images[0]),
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
          20.horizontalSpace,
          Expanded(
            child: SizedBox(
              height: 110,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  14.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          foodBean.name ?? "",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16.sp, color: Colors.black),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFAAAAAA),
                        size: 16,
                      )
                    ],
                  ),
                  11.verticalSpace,
                  const Divider(
                    height: 10,
                    endIndent: 40,
                  ),
                  Text(
                    foodBean.createdAt,
                    style:
                        TextStyle(fontSize: 14.sp, color: const Color(0xFF030303).withOpacity(0.4)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
