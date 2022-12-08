import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../core/app_export.dart';

class AppLoader extends StatelessWidget {
  static Size? size;

  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              width: size!.width * 0.05,
              height: size!.width * 0.05,
              child: getLoader(),
            ),
          ],
        ),
      ),
    );
  }

  getLoader() {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator();
    } else {
      return CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.appColor),
      );
    }
  }
}

class AppLoaderForImage extends StatelessWidget {
  final ImageChunkEvent loadingProgress;

  const AppLoaderForImage(this.loadingProgress);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 20,
        height: 20,
        child: Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        ));
  }
}
