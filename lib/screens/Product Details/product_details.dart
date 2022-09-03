import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/screens/Product%20Details/widgets/carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(myProductsDetailsScreenModel.notifier).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myProductsDetailsScreenModel);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          // margin: EdgeInsets.symmetric(horizontal: 15.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 370.0.h,
                      autoPlay: true,
                      viewportFraction: 1,
                    ),
                    itemCount: state.productModel.productImages?.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final image = state.productModel.productImages![index];
                      return showImages(image, index);
                    },
                  ),
                  Positioned(
                    top: 20.0.h,
                    child: Padding(
                      padding: EdgeInsets.only(right: 48.0.w, left: 20.0.w),
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
                    child: Text('${state.productModel.productName}',
                        style: AppStyles.boldgreyText),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${state.productModel.productPrice}',
                        style: AppStyles.normalgreyText),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '${state.productModel.productDescription}',
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
                  ShoeSizes(size: 'US 8'),
                  ShoeSizes(size: 'US 9'),
                  ShoeSizes(size: 'US 10'),
                  ShoeSizes(size: 'US 11'),
                ],
              ),
              SizedBox(
                height: 35.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.favorite_outline_outlined,
                    size: 35.0.h,
                    color: AppColors.lightgreyColor,
                  ),
                  InkWell(
                    onTap: () {
                      ref
                          .read(myProductsDetailsScreenModel.notifier)
                          .addtoCart();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CartPage()));
                    },
                    child: CustomButton(
                      width: 230.0.w,
                      buttonText: 'Add to Cart',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
