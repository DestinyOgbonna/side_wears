import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/styles/utils/shimmers/cart_shimmer.dart';

class FavoritePage extends ConsumerStatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends ConsumerState<FavoritePage> {
  @override
  void initState() {
    super.initState();
    ref.read(myFavoritescreenModel.notifier).getProductsFromFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: MyAppBar(
          isSettings: false,
          title: 'Favorite',
          isProfile: true,
          sideWidget: InkWell(
            onTap: () {
              ref
                  .read(myFavoritescreenModel.notifier)
                  .deleteProductsFromFavorite();
            },
            child: Icon(
              Icons.delete,
              color: AppColors.redColor,
              size: 25.0.h,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: RefreshIndicator(
          displacement: 250,
          backgroundColor: AppColors.lightgreyColor,
          color: AppColors.whiteColor,
          strokeWidth: 1.0,
          onRefresh: () async {
            ref.watch(myFavoritescreenModel.notifier).getProductsFromFavorite();
          },
          child: Container(
            margin: EdgeInsets.only(top: 15.0.h),
            child: Column(
              children: [
                SizedBox(
                  height: 510.0.h,
                  child: FutureBuilder<List<Product>>(
                      future: ref
                          .watch(myFavoritescreenModel.notifier)
                          .getProductsFromFavorite(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CartShimmer();
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text('Oopss No Favorites...'),
                            );
                          }
                          final favoriteItems = snapshot.data;
                          return ScrollConfiguration(
                            behavior: RemoveScrollGlow(),
                            child: ListView.separated(
                              itemCount: favoriteItems!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.endToStart,
                                  onDismissed: (_) {
                                    ref
                                        .read(myProductsDetailsScreenModel
                                            .notifier)
                                        .removeFromFavorite();
                                  },
                                  child: Container(
                                    key: const ValueKey(Text),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    height: 115,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 150.0.h,
                                          width: 100.0.h,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${favoriteItems[index].productImages?[1]}'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        ConstrainedBox(
                                          constraints:
                                              const BoxConstraints.expand(
                                                  width: 150),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 19),
                                              Text(
                                                  '${favoriteItems[index].productName}',
                                                  style:
                                                      AppStyles.normalgreyText),
                                              const SizedBox(height: 10),
                                              Text(
                                                  '\$${favoriteItems[index].productPrice}',
                                                  style:
                                                      AppStyles.smallgreyText),
                                              const SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  background: Container(
                                    decoration: const BoxDecoration(
                                      color: AppColors.redColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 15),
                                    alignment: Alignment.centerRight,
                                    child: const Padding(
                                      padding: EdgeInsets.only(right: 48.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(
                                  height: 10.0.h,
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Oopss An error occured.....'),
                          );
                        }
                        return const Center(child: CircularProgressIndicator());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
