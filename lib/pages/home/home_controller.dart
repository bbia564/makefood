import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../db/db_service.dart';
import '../../entity/food_bean.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find<HomeController>();
  final db = Get.find<DatabaseService>();
  final list = <FoodBean>[].obs;
  final DateFormat formatterDay = DateFormat('MM/dd/yyyy');
  @override
  onInit() {
    super.onInit();

    initData();
  }

  initData() async {
    list.value = await db.getAll();
  }
}
