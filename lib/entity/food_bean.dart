import 'dart:io';

import 'package:flutter/rendering.dart';

class FoodBean {
  int id;
  String name;
  List<String> images;
  List<String> steps;
  String createdAt;

  FoodBean(
    this.id,
    this.name,
    this.images,
    this.steps,
    this.createdAt,
  );

  factory FoodBean.fromJson(Map<String, dynamic> json) {
    String? imagePatStr = json['images'];
    List<String> images = [];
    if (imagePatStr != null) {
      if (imagePatStr.contains(",")) {
        images = imagePatStr.split(",");
      } else {
        images.add(imagePatStr);
      }
    }
    String? stepsStr = json['steps'];
    List<String> stepsList = [];
    if (stepsStr != null) {
      if (stepsStr.contains("#")) {
        List lis = stepsStr.split("#");
        for (var v in lis) {
          stepsList.add(v);
        }
      } else {
        stepsList.add(stepsStr);
      }
    }
    return FoodBean(
      json['id'],
      json['name'],
      images,
      stepsList,
      json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name": name,
      "created_at": createdAt,
    };
  }
}
