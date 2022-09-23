import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/screens/Product%20Details/widgets/carousel.dart';
import 'package:building_ui/screens/Product%20Details/widgets/clothes_sizes.dart';
import 'package:building_ui/styles/utils/shimmers/product_detail_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HoodiesDetails extends ConsumerStatefulWidget {
  const HoodiesDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HoodiesDetailsState();
}

class _HoodiesDetailsState extends ConsumerState<HoodiesDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(myProductsDetailsScreenModel.notifier).getHoddies();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myProductsDetailsScreenModel);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          child: FutureBuilder<Product?>(
            future: ref.watch(myProductsDetailsScreenModel.notifier).getHoddies(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Shimmers();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                final hoodiesDetails = snapshot.data;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 400.0.h,
                            autoPlay: true,
                            viewportFraction: 1,
                          ),
                          itemCount: hoodiesDetails!.productImages?.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final image = hoodiesDetails.productImages![index];
                            return showImages(image, index);
                          },
                        ),
                        Positioned(
                          top: 20.0.h,
                          child: Padding(
                            padding:
                                EdgeInsets.only(right: 48.0.w, left: 20.0.w),
                            child: InkWell(
                              onTap: () {
                                context.router.pop();
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.whiteColor,
                                radius: 18.0.r,
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: AppColors.darkColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${hoodiesDetails.productName}',
                              style: AppStyles.boldgreyText),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${hoodiesDetails.productPrice}',
                              style: AppStyles.normalgreyText),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.expand(height: 100),
                        child: Text(
                          '${hoodiesDetails.productDescription}',
                          style: AppStyles.mediumgreyText,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        HoodieSizes(size: 'M'),
                        HoodieSizes(size: 'L'),
                        HoodieSizes(size: 'XL'),
                        HoodieSizes(size: 'XXL'),
                      ],
                    ),
                    SizedBox(
                      height: 35.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            ref
                                .read(myProductsDetailsScreenModel.notifier)
                                .toggleFavouriteIcon();
                          },
                          child: state.isSelected != true
                              ? Icon(
                                  Icons.favorite,
                                  size: 35.0.h,
                                  color: AppColors.lightgreyColor,
                                )
                              : Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 35.0.h,
                                  color: AppColors.lightgreyColor,
                                ),
                        ),
                        InkWell(
                          onTap: () {
                            ref
                                .read(myProductsDetailsScreenModel.notifier)
                                .addToCart();
                            context.router.push(const CartPageRoute());
                          },
                          child: CustomButton(
                            width: 230.0.w,
                            buttonText: 'Add to Cart',
                          ),
                        )
                      ],
                    ),
                  ],
                );
              }
              return const SizedBox();
            }),
          ),
        ),
      ),
    );
  }
}
