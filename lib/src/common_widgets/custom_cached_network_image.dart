import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  const CustomCacheNetworkImage(
      {Key? key,
      required this.imageUrl,
      required this.placeHolderColor,
      required this.boxFit,
      required this.borderRadius})
      : super(key: key);

  final String imageUrl;
  final Color placeHolderColor;
  final BoxFit boxFit;
  final int borderRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius.r),
                image: DecorationImage(
                  image: imageProvider,
                  fit: boxFit,
                ),
              ),
            ),
        placeholder: (context, url) => Shimmer(
              child: const SizedBox.expand(),
            ),
        errorWidget: (context, url, error) => const Icon(Icons.error));
  }
}
