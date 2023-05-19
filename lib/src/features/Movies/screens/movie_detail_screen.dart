import 'package:assesment_test/app/assets_paths/assets_paths.dart';
import 'package:assesment_test/src/common_widgets/custom_cached_network_image.dart';
import 'package:assesment_test/src/features/Movies/controller/movie_detail_controller.dart';
import 'package:assesment_test/src/features/Movies/widgets/build_get_tickets_widget.dart';
import 'package:assesment_test/src/features/Movies/widgets/build_watch_trailer_widget.dart';
import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:assesment_test/utils/extensions/extension.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({Key? key}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<MovieDetailController>();
    Future.microtask(() async {
      await controller.getMoviesDetailData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isDetailFetching.value
            ? Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.navigationBarBg,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: 466.h,
                          width: double.infinity,
                          child: CustomCacheNetworkImage(
                            imageUrl:
                                '$imageBaseURl${controller.movieDetailResponse.value.posterPath!}',
                            placeHolderColor: ColorConstants.navigationBarBg,
                            boxFit: BoxFit.cover,
                            borderRadius: 0,
                          ),
                        ),
                        Positioned(
                          top: 64.h,
                          left: 24.w,
                          child: InkWell(
                            onTap: () => controller.navigation.goBack(),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  SvgAssetsPaths.arrowSvg,
                                ),
                                SizedBox(
                                  width: 24.w,
                                ),
                                Text(AppStrings.watch,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 34.h,
                          child: Column(
                            children: [
                              Text(
                                  '${AppStrings.inTheaters} ${controller.movieDetailResponse.value.releaseDate!.formatDateString()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 15.h,
                              ),
                              const BuildGetTicketsWidget(),
                              SizedBox(
                                height: 10.h,
                              ),
                              BuildWatchTrailerWidget(
                                onPress: () {
                                  controller.watchMovieTrailer();
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 27.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppStrings.genres,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: ColorConstants.textColor)),
                          SizedBox(
                            height: 14.h,
                          ),
                          SizedBox(
                            height: 25.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .movieDetailResponse.value.genres!.length,
                                itemBuilder: (context, i) {
                                  return textInContainer(
                                      color: controller.colorList[i],
                                      title: controller.movieDetailResponse
                                          .value.genres![i].name!);
                                }),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          const Divider(),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(AppStrings.overview,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: ColorConstants.textColor)),
                          SizedBox(
                            height: 14.h,
                          ),
                          Text(controller.movieDetailResponse.value.overview!,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorConstants.textColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget textInContainer({color, title}) {
    return Container(
      margin: EdgeInsets.only(
        right: 5.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: color,
      ),
      child: Text(title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: Colors.white)),
    );
  }
}
