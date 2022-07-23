import 'package:building_ui/exports/exports.dart';

class ProductDetails extends ConsumerStatefulWidget {
  const ProductDetails({Key? key, this.productId}) : super(key: key);
  final String? productId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  final CollectionReference productRef =
      FirebaseFirestore.instance.collection('products');
  //!DO this in viewmodel
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<DocumentSnapshot<Object?>>(
          future: productRef.doc(widget.productId).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Scaffold(
                  body: Center(child: Text('Error retrieving data')));
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!snapshot.data: ${snapshot.data}');
              return Column(
                children: [
                  SizedBox(
                    height: 40.0.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 48.0.h, left: 20.0.h),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.lightgreyColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(460.0.h),
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              top: 13.0.h,
                              child: Text('Man\'s Shoes',
                                  style: AppStyles.productText),
                            ),
                            Positioned(
                              top: 30.0.h,
                              child: Text('${data['product_name']}',
                                  style: AppStyles.boldwhiteText),
                            ),
                            Positioned(
                              top: 150,
                              child: SizedBox(
                                height: 300,
                                width: 300,
                                child: CustomPaint(
                                  painter: _Circle(),
                                  size: const Size(50, 50),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 100.0.h,
                              child: Image.network(
                                '${data['product_image']}',
                                height: 200.0.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 432.0.h),
                        child: Container(
                          height: 250,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            color: AppColors.darkBlueColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0.h),
                                child: const Text(
                                  'Choose size',
                                  style: TextStyle(
                                      inherit: false,
                                      color: AppColors.lightgreyColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  ShoeSizes(size: 'US 8'),
                                  ShoeSizes(size: 'US 9'),
                                  ShoeSizes(size: 'US 10'),
                                  ShoeSizes(size: 'US 11'),
                                ],
                              ),
                              SizedBox(
                                height: 18.0.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('${data['product_price']}',
                                      style: AppStyles.normalwhiteText),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const CartPage()));
                                    },
                                    child: const CustomButton(
                                      width: 150,
                                      buttonText: 'Add',
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              );
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}

// class _GreyRect extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final width = size.width;
//     final height = size.height;

//     final center = Offset(width / 2, height / 2);

//     canvas.translate(center.dx, center.dy);
//     final circlePaint = Paint()
//       ..color = const Color(0XFF111A2D)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 2;

//     final a = Offset(size.width * -1 / 2, size.height * -1 / 2);
//     final b = Offset(size.width * 1 / 2, size.height * 1.3 / 4);
//     final rect = Rect.fromPoints(a, b);

//     canvas.drawRect(rect, circlePaint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }

class _Circle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final center = Offset(width / 2, height / 2.3);
    const circleOffset = Offset.zero;

    canvas.translate(center.dx, center.dy);
    final circlePaint = Paint()
      ..color = const Color.fromARGB(255, 42, 59, 94)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    canvas.drawCircle(circleOffset, 150, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
