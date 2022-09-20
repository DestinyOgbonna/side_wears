import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/styles/utils/shimmers/styles/shimmer_shapes.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerShapes.rectangular(
      width: double.infinity,
      height: 50.0.h,
      shape: const RoundedRectangleBorder(),
    );
  }
}
