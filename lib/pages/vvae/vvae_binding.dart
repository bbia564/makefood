import 'package:get/get.dart';

import 'vvae_logic.dart';

class VaeListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
