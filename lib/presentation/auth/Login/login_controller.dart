import 'dart:convert';
import 'dart:developer';

import 'package:traval/core/utils/app_config.dart';
import 'package:traval/core/utils/local_storage.dart';
import 'package:traval/presentation/comman_widget/app_loader.dart';
import 'package:traval/repo/login/login_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/helper.dart';
import 'package:http/http.dart' as http;

GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: <String>['email'],
);

class LoginScreenController extends GetxController {
  RxString email = "".obs;
  RxString emailError = "".obs;

  RxString password = "".obs;
  RxString passwordError = "".obs;

  RxBool obsure = true.obs;
  RxBool checkboxValue = true.obs;

  RxString name = "".obs;
  RxString fname = "".obs;
  RxString lname = "".obs;
  RxString emailaddress = "".obs;
  RxString socialId = "".obs;

  RxBool googleLoading = false.obs;
  RxBool appleLoading = false.obs;

  bool valid() {
    RxBool isValid = true.obs;
    emailError.value = '';
    passwordError.value = '';
    if (email.isEmpty) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    } else if (!Helper.isEmail(email.value)) {
      emailError.value = "pleaseenteravalidemailaddress".tr;
      isValid.value = false;
    }
    if (password.isEmpty) {
      passwordError.value = "pleaseenteravalidpassword".tr;
      isValid.value = false;
    }
    return isValid.value;
  }

  void login() async {
    if (valid()) {
      LoadingOverlay.of(Get.context!).show();
      http.Response? res = await LoginRepo.loginAPI(
        email: email.value,
        password: password.value,
      );
      LoadingOverlay.of(Get.context!).hide();
      if (res != null) {
        var decoded = json.decode(res.body);
        if (res.statusCode == 200 || res.statusCode == 201) {
          LocalStorage.storeDataInfo(decoded["data"]);
          Get.offAndToNamed(AppRoutes.dashboardScreen);
        } else if (res.statusCode == 401) {
          var decoded = json.decode(res.body);
          if (decoded['message'] == "Email or password incorrect !") {
            toast("Email or password incorrect !");
          } else {
            Get.toNamed(
              AppRoutes.registerVerify,
              arguments: email.value,
            );
          }
        } else if ([409, 403, 400, 422].contains(res.statusCode)) {
          toast(decoded['message']);
        } else if (res.statusCode == 500) {
          toast(AppConfig.api500Error);
        }
      } else {
        toast(AppConfig.apiError);
      }
    }
  }

  GoogleSignInAccount? currentUser;

  googlelogin() async {
    try {
      handleSignIn();
      googleSignIn.onCurrentUserChanged.listen((account) {
        currentUser = account;
        if (currentUser != null) {
          name.value = currentUser!.displayName!;
          var fullname = name.split(' ');
          fname.value = fullname[0];
          lname.value = fullname[1];
          emailaddress.value = currentUser!.email;
          socialId.value = currentUser!.id;
          socialLogin(type: "google");
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> handleSignIn() async {
    try {
      await googleSignIn.signOut();
      await googleSignIn.signIn();
    } catch (error) {
      log(error.toString());
    }
  }

  void loginWithApple() async {
    try {
      const storage = FlutterSecureStorage();

      final email = await storage.read(key: "email");
      final appleId = await storage.read(key: "socialId");
      final firstName = await storage.read(key: "firstName");
      final lastName = await storage.read(key: "lastName");

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      if (credential.toString() != "null") {
        if (credential.userIdentifier != null) {
          await storage.write(
              key: "socialId", value: credential.userIdentifier);
        }
        if (credential.email != null) {
          await storage.write(key: "email", value: credential.email);
        }
        if (credential.givenName != null) {
          await storage.write(key: "firstName", value: credential.givenName);
        }
        if (credential.familyName != null) {
          await storage.write(key: "lastName", value: credential.familyName);
        }

        socialId.value = (appleId ?? credential.userIdentifier)!;
        emailaddress.value = (email ?? credential.email)!;
        fname.value = (firstName ?? credential.givenName)!;
        lname.value = (lastName ?? credential.familyName)!;

        appleLoading.value = true;

        socialLogin(type: "apple");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  socialLogin({
    required String type,
  }) async {
    LoadingOverlay.of(Get.context!).show();
    http.Response? res = await LoginRepo.socialLoginAPI(
      fname: fname.value,
      lname: lname.value,
      socialid: socialId.value,
      socialtype: type,
      email: emailaddress.value,
    );
    googleLoading.value = false;
    appleLoading.value = false;

    LoadingOverlay.of(Get.context!).hide();
    if (res != null) {
      var decoded = json.decode(res.body);
      if (res.statusCode == 200 || res.statusCode == 201) {
        LocalStorage.storeDataInfo(decoded["data"]);
        Get.offAllNamed(AppRoutes.dashboardScreen);
      } else if ([409, 403, 401, 400, 422].contains(res.statusCode)) {
        toast(decoded["data"]["email"].first);
      } else if (res.statusCode == 500) {
        toast(AppConfig.api500Error);
      }
    } else {
      toast(AppConfig.apiError);
    }
  }
}
