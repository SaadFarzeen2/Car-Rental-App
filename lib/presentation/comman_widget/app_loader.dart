import 'dart:ui';
import 'package:traval/presentation/comman_widget/loader.dart';
import 'package:flutter/material.dart';

import '../../core/app_export.dart';

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Get.back();
  }

  void show() {
    showDialog(
      context: _context,
      barrierDismissible: false,
      builder: (BuildContext context) => FullScreenLoader(),
      barrierColor: AppColors.appColor.withOpacity(0.1),
    );
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: Container(
        child: const Center(
          child: AppLoader(),
        ),
      ),
    );
  }
}
