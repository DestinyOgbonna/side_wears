import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/screens/product_details/widgets/carousel.dart';
import 'package:building_ui/styles/utils/shimmers/product_detail_shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ShoesDetails extends ConsumerStatefulWidget {
  const ShoesDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShoesDetailsState();
}

class _ShoesDetailsState extends ConsumerState<ShoesDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(myProductsDetailsScreenModel.notifier).getShoes();
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
                ref.watch(myProductsDetailsScreenModel.notifier).getShoes(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Shimmers();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                final shoeDetails = snapshot.data;
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
                          itemCount: shoeDetails!.productImages?.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final image = shoeDetails.productImages![index];
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
                      height: 15.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${shoeDetails.productName}',
                              style: AppStyles.boldgreyText),
                        ),
                        InkWell(
                          onTap: () {
                            ref
                                .read(myProductsDetailsScreenModel.notifier)
                                .toggleFavouriteIcon();
                          },
                          child: state.isSelected != true
                              ? Icon(
                                  Icons.favorite,
                                  size: 25.0.h,
                                  color: AppColors.lightgreyColor,
                                )
                              : Icon(
                                  Icons.favorite_outline_outlined,
                                  size: 25.0.h,
                                  color: AppColors.lightgreyColor,
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.h, right: 8.0.h),
                      child: Text(
                        '${shoeDetails.productDescription}',
                        style: AppStyles.mediumgreyText,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ShoeSizes(size: 'M'),
                        ShoeSizes(size: 'L'),
                        ShoeSizes(size: 'XL'),
                        ShoeSizes(size: 'XXL'),
                      ],
                    ),
                    SizedBox(
                      height: 35.0.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${shoeDetails.productPrice}',
                              style: AppStyles.normalgreyText),
                        ),
                        Container(
                          height: 30.0.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 1.0, color: AppColors.darkColor)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  size: 18,
                                ),
                                onPressed: () {
                                  ref
                                      .read(
                                          myProductsDetailsScreenModel.notifier)
                                      .increaseItemCount();
                                },
                                splashRadius: 1,
                              ),
                              SizedBox(
                                width: 15.0.h,
                              ),
                              Text(
                                state.myCount.toString(),
                                style: GoogleFonts.montserrat(
                                    color: AppColors.lightgreyColor),
                              ),
                              SizedBox(
                                width: 15.0.h,
                              ),
                              IconButton(
                                splashRadius: 1,
                                icon: const Icon(
                                  Icons.remove,
                                  size: 18,
                                ),
                                onPressed: () {
                                  ref
                                      .read(
                                          myProductsDetailsScreenModel.notifier)
                                      .decreaseItemCount();
                                },
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            ref
                                .read(myProductsDetailsScreenModel.notifier)
                                .addShoesToCart(context);
                            context.router.push(const CartPageRoute());
                          },
                          child: CustomButton(
                            width: 100.0.w,
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
