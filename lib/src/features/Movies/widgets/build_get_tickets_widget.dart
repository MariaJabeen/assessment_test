import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildGetTicketsWidget extends StatelessWidget {
  const BuildGetTicketsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 243.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: ColorConstants.blueColor,
      ),
      child: Center(
        child: Text(AppStrings.getTickets,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: Colors.white)),
      ),
    );
  }
}
