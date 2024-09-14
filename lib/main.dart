import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_diary/pages/add/aadd_controller.dart';
import 'package:food_diary/pages/add/add_food_diary.dart';
import 'package:food_diary/pages/details/controller.dart';
import 'package:food_diary/pages/details/details_page.dart';
import 'package:food_diary/pages/home/home_controller.dart';
import 'package:food_diary/pages/index_tab_page.dart';
import 'package:food_diary/pages/setting/set_controller.dart';
import 'package:food_diary/pages/vvae/vvae_binding.dart';
import 'package:food_diary/pages/vvae/vvae_view.dart';
import 'package:food_diary/res/style.dart';
import 'package:get/get.dart';
import 'db/db_service.dart';
import 'entity/burn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DatabaseService().init());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // 设置状态栏文字和图标颜色为亮色（白色）
  ));
  //禁止横屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
    ); //支持分屏
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/cra',
      getPages: Guas,
      builder: (context, child) {
        return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: Scaffold(
              // Global GestureDetector that will dismiss the keyboard
              resizeToAvoidBottomInset: false,
              body: KeyboardDismissOnTap(
                child: FlutterEasyLoading(
                  child: child,
                ),
              ),
            ));
      },
      theme: AppStyle.lightTheme,
      // themeMode: ThemeMode.light,
      //页面跳转风格
      defaultTransition: Transition.cupertino,
    );
  }
}
List<GetPage<dynamic>> Guas = [
  GetPage(
      name: '/cra',
      page: () => const VaeFanList(),
      binding: VaeListBinding()
  ),
  GetPage(
      name: '/home',
      page: () => const IndexTabPage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<HomeController>(() => HomeController());
          Get.lazyPut<SetController>(() => SetController());
        },
      )),
  GetPage(
      name: '/burn',
      page: () => const BurnConl()
  ),
  GetPage(
      name: '/add',
      page: () => const AddFoodDiary(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<AddFoodDiaryController>(() => AddFoodDiaryController());
        },
      )),
  GetPage(
      name: '/details',
      page: () => const DetailsPagePage(),
      binding: BindingsBuilder(
            () {
          Get.lazyPut<DetailsController>(() => DetailsController());
        },
      )),
];
