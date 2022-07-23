import 'package:building_ui/utils/constants/apptext_styles.dart';
import 'package:building_ui/utils/constants/colors.dart';
import 'package:building_ui/utils/constants/remove_scrollglow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItems extends ConsumerStatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartItemsState();
}

class _CartItemsState extends ConsumerState<CartItems> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: RemoveScrollGlow(),
      child: ListView.separated(
        itemCount: 9,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              //  setState(() {});
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
              child: Container(
                key: const ValueKey(Text),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 115,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightgreyColor
                          .withOpacity(0.5), //color of shadow
                      spreadRadius: 1, //spread radius
                      blurRadius: 3, // blur radius
                      offset: const Offset(0, 2),
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset('assets/images/shoes.png'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 19),
                        Text('Air Shoes 400', style: AppStyles.normalgreyText),
                        const SizedBox(height: 10),
                        Text('Welcome', style: AppStyles.normalgreyText),
                        const SizedBox(height: 10),
                        Text('\$ 600.00', style: AppStyles.smallwhiteText)
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
            ),
            background: Container(
              decoration: const BoxDecoration(
                color: AppColors.redColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
