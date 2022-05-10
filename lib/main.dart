import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
              child: orientation == Orientation.portrait
                  ? portraitWidget()
                  : landscapeWidget()),
        ),
      );
    });
  }

  Row landscapeWidget() {
    return Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 20.h,
                            child: Image.asset(
                              "assets/add.png",
                              fit: BoxFit.cover,
                              color: Colors.red,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/delete.svg",
                            width: 20.h,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Container(
                        height: 90.w,
                        width: 50.h,
                        color: Colors.green,
                        child: Center(
                            child: Text(
                          "height is 50% of device screen\nwidth is 90% of device screen",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        )),
                      ),
                      SizedBox(width: 2.h),
                      Container(
                        height: 90.w,
                        width: 28.h,
                        color: Colors.purple,
                        child: Center(
                            child: Text(
                          "height is 20% of device screen\nwidth is 90% of device screen",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        )),
                      ),
                    ],
                  );
  }

  Column portraitWidget() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30.w,
              child: Image.asset(
                "assets/add.png",
                fit: BoxFit.cover,
                color: Colors.red,
              ),
            ),
            SvgPicture.asset(
              "assets/delete.svg",
              width: 30.w,
              color: Colors.blue,
            ),
          ],
        ),
        Container(
          height: 50.h,
          width: 90.w,
          color: Colors.green,
          child: Center(
              child: Text(
            "height is 50% of device screen\nwidth is 90% of device screen",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          )),
        ),
        SizedBox(height: 2.h),
        Container(
          height: 20.h,
          width: 90.w,
          color: Colors.purple,
          child: Center(
              child: Text(
            "height is 20% of device screen\nwidth is 90% of device screen",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
          )),
        ),
      ],
    );
  }
}
