import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class CartPage extends ConsumerStatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartPageState();
}

class _CartPageState extends ConsumerState<CartPage> {
  @override
  void initState() {
    super.initState();
    ref.read(myCartcreenModel.notifier).getProductsFromCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: const MyAppBar(
          isSettings: false,
          title: 'Cart',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: EdgeInsets.only(top: 15.0.h),
          child: Column(
            children: [
              SizedBox(
                height: 510.0.h,
                child: FutureBuilder<List<Product>>(
                    future: ref
                        .watch(myCartcreenModel.notifier)
                        .getProductsFromCart(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: Text('Oopss No Item in Cart...'),
                          );
                        }
                        final cartItems = snapshot.data;
                        return ScrollConfiguration(
                          behavior: RemoveScrollGlow(),
                          child: ListView.separated(
                            itemCount: cartItems!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (_) {
                                  //  setState(() {});
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
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 150.0.h,
                                        width: 100.0.h,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${cartItems[index].productImages?[1]}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 19),
                                          Text(
                                              '${cartItems[index].productName}',
                                              style: AppStyles.normalgreyText),
                                          const SizedBox(height: 10),
                                          Text(
                                              '${cartItems[index].productPrice}',
                                              style: AppStyles.normalgreyText),
                                          const SizedBox(height: 10),
                                          Text(
                                              '${cartItems[index].productPrice}',
                                              style: AppStyles.normalgreyText),
                                        ],
                                      ),
                                      Container(
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: AppColors.lightgreyColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {},
                                              splashRadius: 30,
                                            ),
                                            Text(
                                              '7',
                                              style: GoogleFonts.montserrat(
                                                  color: AppColors.whiteColor),
                                            ),
                                            IconButton(
                                              splashRadius: 30,
                                              icon: const Icon(Icons.remove),
                                              onPressed: () {},
                                            ),
                                          ],
                                        ),
                                      )
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
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text('Total Price', style: AppStyles.productText),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('\$600.00', style: AppStyles.boldgreyText),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddressPage()));
                        },
                        child: const CustomButton(
                          buttonText: 'Order',
                          width: 150,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
