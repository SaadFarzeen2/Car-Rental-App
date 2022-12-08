import 'package:traval/core/app_export.dart';
import 'package:flutter/material.dart';

class CarCardView extends StatelessWidget {
  final String carimage;
  final Function() onCardTap;
  final String title;
  final String subtitle;
  final String price;
  const CarCardView({
    Key? key,
    required this.carimage,
    required this.onCardTap,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Get.locale == const Locale("ar")
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text(
                      subtitle,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            Expanded(
              child: Image.asset(
                carimage,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.appColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(
                          Get.locale == const Locale("ar") ? 14 : 0,
                        ),
                        topLeft: Radius.circular(
                          Get.locale == const Locale("ar") ? 14 : 0,
                        ),
                        topRight: Radius.circular(
                          Get.locale == const Locale("ar") ? 0 : 14,
                        ),
                        bottomLeft: Radius.circular(
                          Get.locale == const Locale("ar") ? 0 : 14,
                        ),
                      ),
                    ),
                    child: Text(
                      "reservation".tr,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Get.locale == const Locale("ar")
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '  ${price}rs',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const TextSpan(
                            text: '/day  ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff707070),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
