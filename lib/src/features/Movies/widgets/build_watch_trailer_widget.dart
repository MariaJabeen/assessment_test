import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildWatchTrailerWidget extends StatelessWidget {
  final VoidCallback onPress;

  const BuildWatchTrailerWidget({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 243.w,
        height: 50.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.blueColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.play_arrow, color: Colors.white),
            SizedBox(
              width: 3.w,
            ),
            Text(AppStrings.watchTrailer,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
