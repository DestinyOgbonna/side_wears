import 'package:building_ui/exports/exports.dart';

class ShoesTab extends ConsumerStatefulWidget {
  const ShoesTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoesTabState();
}

class _ShoesTabState extends ConsumerState<ShoesTab> {
   final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<QuerySnapshot>(
                    future: _firestoreCollectionService.productsRef.get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                            child: CircularProgressIndicator.adaptive());
                      }
                      if (snapshot.connectionState == ConnectionState.none) {
                        return const Center(child: Text('No data'));
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SizedBox(
                          height: 250.0.h,
                          child: ScrollConfiguration(
                            behavior: RemoveScrollGlow(),
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 3,
                              controller:
                                  ScrollController(keepScrollOffset: false),
                              mainAxisSpacing: 3,
                              semanticChildCount: 6,
                              children: snapshot.data!.docs.map(
                                (document) {
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                            productId: document.id,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Sneakers(
                                      prodImage: (document.data()
                                          as dynamic)['product_image'][0],
                                      prodName:
                                          '${(document.data() as dynamic)['product_name']}',
                                      prodPrice:
                                          '\$${(document.data() as dynamic)['product_price']}',
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        );
                      }
                      return const Center(child: Text('No data'));
                    },
                  );
  }
}