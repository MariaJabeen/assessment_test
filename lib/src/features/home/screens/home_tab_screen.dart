import 'package:assesment_test/app/assets_paths/assets_paths.dart';
import 'package:assesment_test/src/features/Movies/screens/movies_screen.dart';
import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTabsScreen extends StatefulWidget {
  const HomeTabsScreen({Key? key}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  State<HomeTabsScreen> createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {

  @override
  void initState() {
    super.initState();
  }

  final _borderRadius = BorderRadius.only(
    topLeft: Radius.circular(27.r),
    topRight: Radius.circular(27.r),
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: ColorConstants.watchBgColor,
          extendBody: true,
          body: const MoviesScreen(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
            ),
            child: ClipRRect(
              borderRadius: _borderRadius,
              child: BottomNavigationBar(
                backgroundColor: ColorConstants.navigationBarBg,
                selectedItemColor: ColorConstants.white,
                unselectedItemColor: ColorConstants.white.withOpacity(0.54),
                currentIndex: 1,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 10.sp,
                unselectedFontSize: 10.sp,
                onTap: (int i) {},
                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: EdgeInsets.only(bottom: 7.h),
                        child: SvgPicture.asset(SvgAssetsPaths.dashboardSvg),
                      ),
                      label: AppStrings.dashboard),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 7.h),
                          child: SvgPicture.asset(SvgAssetsPaths.watchSvg)),
                      label: AppStrings.watch),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 7.h),
                          child: SvgPicture.asset(SvgAssetsPaths.librarySvg)),
                      label: AppStrings.mediaLibrary),
                  BottomNavigationBarItem(
                      icon: Padding(
                          padding: EdgeInsets.only(bottom: 7.h),
                          child: SvgPicture.asset(SvgAssetsPaths.moreSvg)),
                      label: AppStrings.more),
                ],
              ),
            ),
          ),
        ));
  }
}
