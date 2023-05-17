import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        key: const ValueKey("main_app"),
        debugShowCheckedModeBanner: false,
        // enableLog: true,
        // initialRoute: Routes.splash,
        // defaultTransition: Transition.fade,
        // getPages: AppPages.routes,
        // initialBinding: AppBinding(),
        // smartManagement: SmartManagement.keepFactory,
        title: 'FingeRate',
        // theme: ThemeConfig.lightTheme,
        // locale: sl<TranslationService>().locale,
        // fallbackLocale: TranslationService.fallbackLocale,
        // translations: sl<TranslationService>(),
        // builder: EasyLoading.init(),
      ),
    );MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        ),
        body: Center()
    );
  }
}
