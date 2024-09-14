import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_diary/pages/setting/set_page.dart';
import 'package:get/get.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import 'home/home_page.dart';

class IndexTabPage extends StatefulWidget {
  const IndexTabPage({super.key});

  @override
  State<IndexTabPage> createState() => _HomePageState();
}

class _HomePageState extends State<IndexTabPage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: currentIndex,
        children: const [HomePage(), SettingPage()],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF5902C) ,
        shape: const OvalBorder(),
        onPressed: () {
          Get.toNamed('/add');
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFFF5902C),
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_home.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_home_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/ic_mine.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          activeIcon: Image.asset("assets/images/ic_mine_s.png",
              width: 22.w,
              excludeFromSemantics: true, //去除图片语义
              gaplessPlayback: true),
          label: 'Mine',
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        Get.focusScope?.unfocus();
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
