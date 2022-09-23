import 'dart:developer';

import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/screens/Product%20Details/widgets/carousel.dart';
import 'package:building_ui/styles/utils/shimmers/product_detail_shimmer.dart';
import 'package:building_ui/styles/utils/shimmers/products_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WristWatchDetails extends ConsumerStatefulWidget {
  const WristWatchDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WristWatchDetailsState();
}

class _WristWatchDetailsState extends ConsumerState<WristWatchDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(myProductsDetailsScreenModel.notifier).getWristWatch();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myProductsDetailsScreenModel);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          child: FutureBuilder<Product?>(
            future:
                ref.read(myProductsDetailsScreenModel.notifier).getWristWatch(),
            builder: (context,snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Shimmers();
              }
              if (snapshot.connectionState == ConnectionState.done) {
               final watchDetail = snapshot.data;
    
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
                              initialPage: 1),
                          itemCount: watchDetail!.productImages?.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final image =
                               watchDetail.productImages![index];
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
                                Navigator.pop(context);
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
                          child: Text('${watchDetail.productName}',
                              style: AppStyles.boldgreyText),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${watchDetail.productPrice}',
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
                        constraints: const BoxConstraints.expand(height: 150),
                        child: Text(
                          '${watchDetail.productDescription}',
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
                        ShoeSizes(size: 'Gold'),
                        ShoeSizes(size: 'Silver'),
                        ShoeSizes(size: 'Platinum'),
                        ShoeSizes(size: 'Classic'),
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
            },
          ),
        ),
      ),
    );
  }
}
