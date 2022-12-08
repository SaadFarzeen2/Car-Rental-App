import 'package:traval/core/app_export.dart';
import 'package:traval/core/service/notification.dart';
import 'package:traval/core/utils/app_theme.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/localization/localization_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:traval/presentation/auth/login/login_controller.dart';
import 'package:traval/presentation/dashboard/myReservations/reservations_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LazyBinding().dependencies();
  await Firebase.initializeApp();
  await GetStorage.init();
  LocalStorage.loadLocalData();
  // NotificationService.init();

  runApp(const MyApp());
}
//ek mint pub get kr liay

class LazyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginScreenController>(
      () => LoginScreenController(),
      fenix: true,
    );
    Get.lazyPut<MyReservationsScreenController>(
      () => MyReservationsScreenController(),
      fenix: true,
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashScreen,
      theme: AppTheme.themeData,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.cupertino,
      locale: LocalizationService.locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
    );
  }
}
