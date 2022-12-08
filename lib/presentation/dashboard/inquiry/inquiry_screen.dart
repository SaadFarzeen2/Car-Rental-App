import 'package:traval/core/app_export.dart';
import 'package:traval/presentation/comman_widget/app_bar.dart';
import 'package:traval/presentation/comman_widget/app_button.dart';
import 'package:traval/presentation/dashboard/inquiry/inquiry_controller.dart';
import 'package:flutter/material.dart';

class InquiryScreen extends StatelessWidget {
  InquiryScreen({super.key});
  final InquiryController _controller = Get.put(InquiryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(text: 'queries'.tr),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              hSizedBox36,
              Container(
                padding: const EdgeInsets.all(20),
                width: Get.width,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (val) {
                        _controller.name.value = val;
                        _controller.nameError.value = "";
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'name'.tr,
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 194, 187, 187),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xff707070),
                    ),
                    Obx(
                      () => (_controller.nameError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                child: Text(
                                  _controller.nameError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox2,
                    ),
                    TextField(
                      onChanged: (val) {
                        _controller.email.value = val;
                        _controller.emailError.value = "";
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'email'.tr,
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 194, 187, 187),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xff707070),
                    ),
                    Obx(
                      () => (_controller.emailError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                child: Text(
                                  _controller.emailError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox2,
                    ),
                    TextField(
                      onChanged: (val) {
                        _controller.message.value = val;
                        _controller.messageError.value = "";
                      },
                      maxLines: 4,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'message'.tr,
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 194, 187, 187),
                        ),
                      ),
                    ),
                    Obx(
                      () => (_controller.messageError.value.isNotEmpty)
                          ? Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                color: Colors.transparent,
                                child: Text(
                                  _controller.messageError.value,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            )
                          : hSizedBox2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              AppButton(
                onPressed: () {
                  _controller.onvalidate();
                },
                text: "submit".tr,
                width: Get.width / 1.8,
              ),
              hSizedBox20,
            ],
          ),
        ),
      ),
    );
  }
}
