import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/exports/exports.dart';

Widget showImages(String image, int index) => SizedBox(
      width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: image,
        key: UniqueKey(),
        height: 500.0.h,
        width: double.infinity,
      ),
    );

