import 'package:building_ui/exports/exports.dart';

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
    final state = ref.watch(myHomeScreenModel);
    return 
    
    // state.loadingState == LoadingState.loading
    //     ? const Center(child: CircularProgressIndicator())
    //     : state.loadingState == LoadingState.error
    //         ? const Center(
    //             child: Text('Oops! Something went wrong'),
    //           )
    //         : 
            
            SizedBox(
                height: 250.0.h,
                child: ScrollConfiguration(
                  behavior: RemoveScrollGlow(),
                  child: GridView.builder(
                    controller: ScrollController(keepScrollOffset: false),
                    semanticChildCount: 6,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                                productId: state.productModel.id,
                              ),
                            ),
                          );
                        },
                        child: Sneakers(
                          prodImage: '${state.productModel.productImages?[0]}',
                          prodName: '${state.productModel.productName}',
                          prodPrice: '${state.productModel.productPrice}',
                        ),
                      );
                    },
                  ),
                ),
              );
  }
}
