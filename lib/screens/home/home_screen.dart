import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/screens/home/products_tabs/hoodies.dart';
import 'package:building_ui/screens/home/products_tabs/shoe_tabs.dart';
import 'package:building_ui/screens/home/products_tabs/watches.dart';
import 'package:building_ui/screens/home/products_tabs/wears.dart';
import 'package:building_ui/styles/utils/shimmers/home_shimmer.dart';
import 'package:building_ui/styles/utils/shimmers/product_detail_shimmer.dart';

import '../../core/services/local_notification.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  late final LocalNotificationService service;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    service.showScheduledNotification();
    ref.read(myProductsDetailsScreenModel.notifier).getProducts();
    ref.read(myHomeScreenModel.notifier).getUsername();
    ref.read(myHomeScreenModel.notifier).getShoeProducts();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            bottom: false,
            child: TweenAnimationBuilder(
              builder: (BuildContext context, double? value, Widget? child) {
                return Padding(
                  padding:
                      EdgeInsets.only(top: value!, left: value, right: value),
                  child: SizedBox(
                    child: Column(
                      children: [
                        FutureBuilder<UserModel?>(
                            future: ref
                                .watch(myHomeScreenModel.notifier)
                                .getUsername(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const HomeShimmer();
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: Text('Welcome User'),
                                  );
                                }
                              }

                              return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/person.png'),
                                      radius: 30,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 90.0),
                                      child: Text(
                                        'Good day,${snapshot.data?.username}',
                                        style: AppStyles.normalgreyText,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context.router
                                            .push(const CartPageRoute());
                                      },
                                      child: const Icon(
                                        Icons.shopping_cart_checkout_outlined,
                                        size: 30,
                                        color: AppColors.lightgreyColor,
                                      ),
                                    ),
                                  ]);
                            }),

                        SizedBox(height: 22.0.h),

                        Container(
                          height: 150.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0.r),
                            ),
                            image: const DecorationImage(
                                image: AssetImage('assets/images/st.jpg'),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0.h, left: 10.0.w),
                            child: Text('New items with \nfree shipping',
                                style: AppStyles.boldgreyText),
                          ),
                        ),
                        SizedBox(
                          height: 19.0.h,
                        ),
                        // give the tab bar a height [can change hheight to preferred height]
                        TabBar(
                          controller: _tabController,
                          indicatorColor: AppColors.purpleColor,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          tabs: const [
                            // first tab [you can add an icon using the icon property]
                            Tab(
                              child: Categories(
                                image: 'assets/icons/shoe.png',
                                title: 'Shoes',
                              ),
                            ),

                            Tab(
                              child: Categories(
                                image: 'assets/icons/hoodie.png',
                                title: 'Hoodies',
                              ),
                            ),
                            Tab(
                              child: Categories(
                                image: 'assets/icons/tshirt.png',
                                title: 'T-shirt',
                              ),
                            ),
                            Tab(
                              child: Categories(
                                image: 'assets/icons/watch.png',
                                title: 'Watches',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 19.0.h,
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: const [
                              ShoesTab(),
                              HoodiesTab(),
                              WearsTab(),
                              WatchesTab()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              duration: const Duration(seconds: 3),
              tween: Tween<double>(begin: 0, end: 10),
              curve: Curves.ease,
            ),
          ),
        ),
      ),
    );
  }

//* Activating Local Notifications
  void listenToNotification() {
    service.onNotificationClick.stream.listen(onNotificationListener);
  }

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
  }
}
