import 'package:assesment_test/app/assets_paths/assets_paths.dart';
import 'package:assesment_test/src/common_widgets/custom_cached_network_image.dart';
import 'package:assesment_test/src/features/Movies/controller/movies_controller.dart';
import 'package:assesment_test/utils/constants/color_constants.dart';
import 'package:assesment_test/utils/constants/string_constants.dart';
import 'package:assesment_test/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesScreenController controller;
  late TextEditingController textEditingController;
  @override
  void initState() {
    super.initState();
    controller = Get.find<MoviesScreenController>();
    textEditingController = TextEditingController();
    Future.microtask(() async {
      await controller.getMoviesListData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 20.w, right: 20.w, top: 63.h, bottom: 12.h),
            child: Obx(
              () => getSearchView(controller.searchingMovie.value),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: ColorConstants.watchBgColor,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: GetBuilder<MoviesScreenController>(builder: (context) {
                  return Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        controller.isFetchingList.value
                            ? Expanded(
                                child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: ColorConstants.navigationBarBg,
                                  ),
                                ],
                              ))
                            : controller.searchingInVisible(
                                    textEditingController.text)
                                ? Expanded(
                                    child: ListView.builder(
                                        itemCount: controller.moviesList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 180.h,
                                            margin:
                                                EdgeInsets.only(bottom: 20.h),
                                            decoration: BoxDecoration(
                                                color: ColorConstants
                                                    .navigationBarBg
                                                    .withOpacity(0.3),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.r)),
                                            child: InkWell(
                                              onTap: () {
                                                controller.setSelectedMovie(
                                                    controller
                                                        .moviesList[index].id!);
                                              },
                                              child: Stack(
                                                alignment:
                                                    AlignmentDirectional.center,
                                                children: [
                                                  CustomCacheNetworkImage(
                                                    imageUrl:
                                                        '$imageBaseURl${controller.moviesList[index].posterPath!}',
                                                    placeHolderColor:
                                                        ColorConstants
                                                            .navigationBarBg,
                                                    boxFit: BoxFit.cover,
                                                    borderRadius: 10,
                                                  ),
                                                  Positioned(
                                                      bottom: 20.h,
                                                      left: 20.h,
                                                      child: Text(
                                                          controller
                                                              .moviesList[index]
                                                              .title!,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.sp,
                                                              color: Colors
                                                                  .white)))
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                : controller.searchingVisible(
                                        textEditingController.text)
                                    ? Expanded(
                                        child: ListView.builder(
                                            itemCount:
                                                controller.searchResults.length,
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 20.h),
                                                child: InkWell(
                                                  onTap: () {
                                                    controller.setSelectedMovie(
                                                        controller.searchResults[index].id!);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        height: 100.h,
                                                        width: 130.w,
                                                        child:
                                                            CustomCacheNetworkImage(
                                                          imageUrl:
                                                              '$imageBaseURl${controller.searchResults[index].posterPath!}',
                                                          placeHolderColor:
                                                              ColorConstants
                                                                  .navigationBarBg,
                                                          boxFit: BoxFit.cover,
                                                          borderRadius: 10,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 20.w,
                                                      ),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                controller
                                                                    .searchResults[
                                                                        index]
                                                                    .title!,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      16.sp,
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                      // Spacer(),
                                                      SvgPicture.asset(
                                                          SvgAssetsPaths
                                                              .optionSvg)
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      )
                                    : Container(),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getSearchView(SearchMovie searchMovie) {
    switch (searchMovie) {
      case SearchMovie.disabled:
        return Row(
          children: [
            Text(AppStrings.watch,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                )),
            const Spacer(),
            InkWell(
                onTap: () =>
                    controller.updateSearchingMovie(SearchMovie.enabled),
                child: SvgPicture.asset(SvgAssetsPaths.searchSvg)),
          ],
        );
      case SearchMovie.enabled:
        return Card(
          elevation: 0,
          color: ColorConstants.watchBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: TextField(
              onChanged: (value) {
                controller.searchMovie(textEditingController.text);
              },
              controller: textEditingController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      textEditingController.clear();
                      controller.searchResults.clear();
                      controller.updateSearchingMovie(SearchMovie.disabled);
                    },
                    icon: SvgPicture.asset(SvgAssetsPaths.closeSvg)),
                prefixIcon:  SvgPicture.asset(SvgAssetsPaths.searchSvg),
                hintText: AppStrings.searchHint,
                hintStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.textColor.withOpacity(0.3)),
                border: InputBorder.none,
              ),
            ),
          ),
        );
    }
  }
}
