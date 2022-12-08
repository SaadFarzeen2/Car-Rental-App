import '../../../core/app_export.dart';

class ReservationScreenController extends GetxController {
  RxString reservationNumber = "".obs;
  RxString reservationNumberError = "".obs;

  bool validation() {
    RxBool isValid = true.obs;

    if (reservationNumber.value.isEmpty) {
      reservationNumberError.value = "enterreservationnumber".tr;
      isValid.value = false;
    }

    return isValid.value;
  }

  onReservationNumber() {
    // debugPrint("err");
    // if (validation()) {
    //   debugPrint("Suceess");
    //   Get.toNamed(AppRoutes.carPreviewScreen);
    // }
  }
}
