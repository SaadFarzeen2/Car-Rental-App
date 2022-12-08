import 'package:traval/core/app_export.dart';

class SearchController extends GetxController {
  RxString title = "فرع قرطبه مخرج 8".obs,
      city = "Qurtubah, Riyadh".obs,
      phone = "9660000000000" "+".obs;

  List<Map> data = [
    {
      "title": "فرع قرطبه مخرج 8",
      "city": "Qurtubah, Riyadh",
      "phone": "9660000000000" "+",
    },
    {
      "title": "فرع28",
      "city": "As Suwaidi Al Gharabi, Riyadh",
      "phone": "9660000000000" "+",
    },
    {
      "title": "فرع لبن",
      "city": "Dhahrat laban, Riyadh",
      "phone": "9660000000000" "+",
    },
    {
      "title": "فرع الموسى",
      "city": "Tuwaiq, Riyadh",
      "phone": "9660000000000" "+",
    },
  ];
}
