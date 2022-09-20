import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/styles/utils/shimmers/styles/shimmer_shapes.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: ScrollController(keepScrollOffset: false),
      semanticChildCount: 6,
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (BuildContext context, int index) {
        return ShimmerShapes.rectangular(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          shape: const RoundedRectangleBorder(),
        );
      },
    );
  }
}
