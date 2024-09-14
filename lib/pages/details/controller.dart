import 'package:get/get.dart';
import '../../entity/food_bean.dart';

class DetailsController extends GetxController {
  static DetailsController get to => Get.find<DetailsController>();
  late FoodBean bean;
  List<String> steps = [];

  @override
  onInit() {
    super.onInit();
    bean = Get.arguments["food"];
  }
}
