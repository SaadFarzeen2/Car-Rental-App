import 'package:flutter/material.dart';
// import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
// import 'package:scrollable_clean_calendar/utils/enums.dart';

class DateSelectionScreen extends StatelessWidget {
  const DateSelectionScreen({Key? key}) : super(key: key);
  // final DateSelectionController _controller =
  //     Get.put(DateSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: const [
          // ScrollableCleanCalendar(
          //   calendarController: _controller.calendarController,
          //   layout: Layout.BEAUTY,
          //   calendarCrossAxisSpacing: 0,
          //   daySelectedBackgroundColor: const Color(0xff0467C0),
          //   dayRadius: 100,
          // ),
          // Positioned(
          //   right: 20,
          //   left: 20,
          //   bottom: 20,
          //   child: AppButton(
          //     onPressed: () => Get.toNamed(AppRoutes.initialCarDetailScreen),
          //     text: "continuation".tr,
          //   ),
          // ),
        ],
      ),
    );
  }
}
