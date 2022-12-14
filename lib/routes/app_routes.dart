import 'package:traval/presentation/auth/changePassword/change_password_screen.dart';
import 'package:traval/presentation/auth/login/login_screen.dart';
import 'package:traval/presentation/auth/splash/splash_screen.dart';
import 'package:traval/presentation/auth/verification/verification_screen.dart';
import 'package:traval/presentation/bottomBar/bottombar_screen.dart';
import 'package:traval/presentation/dashboard/addEditProfile/add_edit_profile_screen.dart';
import 'package:traval/presentation/dashboard/car_list/car_list_screen.dart';
import 'package:traval/presentation/dashboard/membership/gold_membership_screen.dart';
import 'package:traval/presentation/dashboard/membership/membership_Screen.dart';
import 'package:traval/presentation/dashboard/membership/platinum_membership.dart';
import 'package:traval/presentation/dashboard/membership/silver_membership.dart';
import 'package:traval/presentation/dashboard/notifications/notification_screen.dart';
import 'package:traval/presentation/dashboard/reservation/reservation_screen.dart';
import 'package:get/get.dart';

import '../presentation/auth/welcome/welcome_screen.dart';
import '../presentation/dashboard/carPreview/car_preview_screen.dart';
import '../presentation/dashboard/change_language/change_language_screen.dart';
import '../presentation/dashboard/date_selection/date_selection_screen.dart';
import '../presentation/dashboard/initial_car_details/initial_car_details_screen.dart';
import '../presentation/dashboard/plan_details/plan_details_screen.dart';
import '../presentation/dashboard/plan_list/plan_list_screen.dart';
import '../presentation/dashboard/moreScreen/more_screen.dart';
import '../presentation/dashboard/myContract/contract_screen.dart';
import '../presentation/dashboard/myReservations/reservations_screen.dart';
import '../presentation/dashboard/profileScreen/profile_screen.dart';
import '../presentation/dashboard/search/search.dart';

class AppRoutes {
  static String splashScreen = '/splashScreen';
  static String welcomeScreen = '/welcomeScreen';
  static String loginScreen = '/loginScreen';
  static String dashboardScreen = '/dashboardScreen';
  static String changePasswordScreen = '/changePasswordScreen';
  static String carPreviewScreen = '/carPreviewScreen';
  static String reservationScreen = '/reservationScreen';
  static String moreScreen = '/moreScreen';
  static String profileScreen = '/profileScreen';
  static String addEditProfileScreen = '/addEditProfileScreen';
  static String myContractScreen = '/myContractScreen';
  static String myReservationsScreen = '/myReservationsScreen';
  static String carListScreen = '/carListScreen';
  static String planDetailScreen = '/planDetailScreen';
  static String planListScreen = '/planListScreen';
  static String dateSelectionScreen = '/dateSelectionScreen';
  static String initialCarDetailScreen = '/initialCarDetailScreen';
  static String searchScreen = '/searchScreen';
  static String languageScreen = '/languageScreen';
  static String notificationScreen = '/notificationScreen';
  static String registerVerify = '/registerVerify';
  static String membershipScreen = '/membershipScreen';
  static String goldmembershipScreen = '/goldmembershipScreen';
  static String silvermembershipScreen = '/silvermembershipScreen';
  static String platinummembershipScreen = '/platinummembershipScreen';

  static List<GetPage> pages = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: welcomeScreen, page: () => WelcomeScreen()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: dashboardScreen, page: () => BottomBarScreen()),
    GetPage(name: changePasswordScreen, page: () => ChangePasswordScreen()),
    GetPage(name: carPreviewScreen, page: () => const CarPreviewScreen()),
    GetPage(name: reservationScreen, page: () => ReservationScreen()),
    GetPage(name: moreScreen, page: () => const MoreScreen()),
    GetPage(name: profileScreen, page: () => ProfileScreen()),
    GetPage(name: addEditProfileScreen, page: () => AddEditProfileScreen()),
    GetPage(name: myContractScreen, page: () => MyContractScreen()),
    GetPage(name: myReservationsScreen, page: () => MyReservationsScreen()),
    GetPage(name: carListScreen, page: () => CarListScreen()),
    GetPage(name: planDetailScreen, page: () => PlanDetailScreen()),
    GetPage(name: planListScreen, page: () => PlanListScreen()),
    GetPage(name: dateSelectionScreen, page: () => const DateSelectionScreen()),
    // GetPage(name: initialCarDetailScreen, page: () => InitialCarDetailScreen(delivery_datetime: null,)),
    GetPage(name: searchScreen, page: () => SearchScreen()),
    GetPage(name: languageScreen, page: () => LanguageListScreen()),
    GetPage(name: registerVerify, page: () => VerifyRegisterScreen()),
    GetPage(name: notificationScreen, page: () => NotificationScreen()),
    GetPage(name: membershipScreen, page: () => MembershipScreen()),
    GetPage(name: goldmembershipScreen, page: () => Gold_Membership_Screen()),
    GetPage(
        name: silvermembershipScreen, page: () => Silver_Membership_Screen()),
    GetPage(
        name: platinummembershipScreen,
        page: () => Platinum_Membership_Screen()),
  ];
}
