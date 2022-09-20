import 'package:building_ui/core/exports/exports.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerShapes extends StatelessWidget {
  const ShimmerShapes.circular(
      {Key? key, required this.width, this.height, required this.shape})
      : super(key: key);
  const ShimmerShapes.rectangular(
      {Key? key, required this.width, this.height, required this.shape})
      : super(key: key);

  final double width;
  final double? height;
  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: ShapeDecoration(
          shape: shape,
          color: Colors.grey,
        ),
      ),
    );
  }
}