import 'dart:developer';

import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class ShoesTab extends ConsumerStatefulWidget {
  const ShoesTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoesTabState();
}

class _ShoesTabState extends ConsumerState<ShoesTab> {
  @override
  void initState() {
    super.initState();
    log('in init state');
    ref.read(myHomeScreenModel.notifier).getShoeProducts();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myHomeScreenModel);

    return

        // state.loadingState == LoadingState.loading
        //     ? const Center(child: CircularProgressIndicator())
        //     : state.loadingState == LoadingState.error
        //         ? const Center(
        //             child: Text('Oops! Something went wrong'),
        //           )
        //         :

        FutureBuilder<List<Product>>(
      future: ref.read(myHomeScreenModel.notifier).getShoeProducts(),
      builder: (ctx, snapshot) {
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            productId: products[index].id,
                          ),
                        ),
                      );
                    },
                    child: Sneakers(
                      prodImage: '${products[index].productImages?[0]}',
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
