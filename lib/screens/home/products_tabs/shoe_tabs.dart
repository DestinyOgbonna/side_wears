import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/styles/utils/shimmers/products_shimmer.dart';

class ShoesTab extends ConsumerStatefulWidget {
  const ShoesTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoesTabState();
}

class _ShoesTabState extends ConsumerState<ShoesTab> {
  @override
  void initState() {
    super.initState();
    ref.read(myHomeScreenModel.notifier).getShoeProducts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>?>(
      future: ref.read(myHomeScreenModel.notifier).getShoeProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProductShimmer();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('No Product Available Yet'),
            );
          }
          final products = snapshot.data;
          return SizedBox(
            height: 250.0.h,
            child: ScrollConfiguration(
              behavior: RemoveScrollGlow(),
              child: GridView.builder(
                controller: ScrollController(keepScrollOffset: false),
                semanticChildCount: 6,
                itemCount: products!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(myProductsDetailsScreenModel.notifier)
                          .productId(products[index].id);
                      context.router.push(const ShoesDetailsRoute());
                    },
                    child: Sneakers(
                      prodImage: '${products[index].productImages?[1]}',
                      prodName: '${products[index].productName}',
                      prodPrice: '${products[index].productPrice}',
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('OOppss An error occured'),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
