import 'package:assesment_test/utils/dependency_injection/app_binding.dart';
import 'package:assesment_test/utils/router/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/router/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              enableLog: true,
              initialRoute: Routes.homeScreen,
              defaultTransition: Transition.fade,
              getPages: AppPages.routes,
              initialBinding: AppBinding(),
              smartManagement: SmartManagement.keepFactory,
              title: 'AssessmentTest',
              builder: EasyLoading.init(),
            ));
  }
}
