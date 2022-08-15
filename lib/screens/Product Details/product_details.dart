import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/screens/Product%20Details/widgets/carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({Key? key, this.productId}) : super(key: key);
  final String? productId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  @override
  void initState() {
    super.initState();
    ref.read(myProductsDetailsScreenModel.notifier).getSingleProductDetails();
  }
  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: _firestoreCollectionService.productsRef
              .doc(widget.productId)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Scaffold(
                  body: Center(child: Text('Error retrieving data')));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return SizedBox(
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
                          itemCount: data['product_image'].length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            final image = data['product_image'][index];
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
                          child: Text('${data['product_name']}',
                              style: AppStyles.boldgreyText),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('\$${data['product_price']}',
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
                        '${data['product_description']}',
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
              );
            }
            return const Center(
              child: SizedBox(child: CircularProgressIndicator.adaptive()),
            );
          },
        ),
      ),
    );
  }
}
