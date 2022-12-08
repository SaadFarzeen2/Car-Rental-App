import 'package:traval/core/app_export.dart';

class CarListController extends GetxController {
  RxString currentStatus = "type".tr.obs;

  List<RxString> status = [
    "type".tr.obs,
    "branches".tr.obs,
    "category".tr.obs,
  ];
}
