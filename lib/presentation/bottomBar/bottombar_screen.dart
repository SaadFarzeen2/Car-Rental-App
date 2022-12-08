import 'package:flutter/material.dart';
import 'bottombar_controller.dart';
import '../../core/app_export.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final BottomBarController _con = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => _con.screen()),
      bottomNavigationBar: bottombar(),
    );
  }

  bottombar() {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.bottomBarColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _con.icons.length,
            (index) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    index == 2
                        ? GestureDetector(
                            onTap: () => _con.pageIndex.value = 2,
                            child: Image.asset(
                              _con.icons[index]['icon'],
                              height: 60,
                            ),
                          )
                        : IconButton(
                            onPressed: () => _con.onTap(index),
                            icon: Image.asset(
                              _con.icons[index]['icon'],
                              height: 26,
                              color: _con.pageIndex.value == index
                                  ? AppColors.appColor
                                  : Colors.grey,
                            ),
                          ),
                    if (index != 2)
                      Text(
                        "${_con.icons[index]['title']}".tr,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 10,
                          color: _con.pageIndex.value == index
                              ? AppColors.appColor
                              : Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
