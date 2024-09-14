import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import '../../db/db_service.dart';
import '../home/home_controller.dart';

class SetController extends GetxController {
  var version = "".obs;

  @override
  void onInit() {
    super.onInit();
    getAppInfo();
  }

  Future<void> getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    // String appName = info.appName;
    // String packageName = info.packageName;
    version.value = info.version;
    // String buildNumber = info.buildNumber;
  }

  final db = Get.find<DatabaseService>();

  onPrivacy(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Privacy Policy"),
          ),
          body: const Markdown(
            data: """
#### Data Collection
Our app does not collect any personal information or user data. All triangle calculations are performed locally on the device and are not transmitted to any external servers.

#### Cookie Usage
Our app does not use any form of cookies or similar technologies to track user behavior or personal information.

#### Data Security
User input data is only used for calculations on the user's device and is not stored or transmitted. We are committed to ensuring the security of user data.

#### Contact Information
If you have any questions or concerns about our privacy policy, please contact us via email.
          """,
          ),
        );
      },
    );
  }

  onCleanData() async {
    Get.dialog(AlertDialog(
      title: const Text('Delete'),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)), // 设置圆角
      ),
      content: const Text('Are you sure you want to delete all data?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            await db.clean();
            Get.back();
            try {
              HomeController.to.list.clear();
            } catch (e) {}
          },
          child: const Text('Confirm'),
        ),
      ],
    ));
  }
}
