import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/styles/utils/shimmers/styles/shimmer_shapes.dart';

class CartShimmer extends StatelessWidget {
  const CartShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ShimmerShapes.rectangular(
              height: 100.0.h,
              width: 90.0.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 19),
                ShimmerShapes.rectangular(
                  height: 30,
                  width: 150,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                const SizedBox(height: 19),
                ShimmerShapes.rectangular(
                  height: 30,
                  width: 150,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                const SizedBox(height: 19),
                ShimmerShapes.rectangular(
                  height: 30,
                  width: 150,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
              ],
            ),
            ShimmerShapes.rectangular(
              height: 100.0.h,
              width: 30.0.h,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 10.0.h,
        );
      },
    );
  }
}
