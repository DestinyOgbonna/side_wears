
import 'package:cached_network_image/cached_network_image.dart';

import '../../../exports/exports.dart';

Widget showImages(String image, int index) => Container(
      height: 300.0.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(5.0.r),
      ));