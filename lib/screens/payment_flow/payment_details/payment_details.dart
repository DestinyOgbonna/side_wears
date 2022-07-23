import 'package:building_ui/exports/exports.dart';

class CardPayment extends ConsumerWidget {
  const CardPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: MyAppBar(
          isSettings: false,
          title: 'Select Payment',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.symmetric(horizontal: 15.0.h),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 45.0.h,
                  ),
                  Text(
                    'Card Number',
                    style: AppStyles.smallgreyText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50.0.h,
                          width: 50,
                          decoration: BoxDecoration(
                            color: AppColors.lightprimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0.r)),
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/master.png')),
                          ),
                        ),
                        SizedBox(
                          width: 270.0.w,
                          child: const CustomTextField(
                            hintText: '**** **** **** 6643',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Expiration',
                        style: AppStyles.smallgreyText,
                      ),
                      Text(
                        'CVV',
                        style: AppStyles.smallgreyText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.0.w,
                          child: const CustomTextField(
                            hintText: 'MM/YY',
                            obscureText: false,
                          ),
                        ),
                        SizedBox(
                          width: 150.0.w,
                          child: const CustomTextField(
                            hintText: 'CVV',
                            obscureText: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.5), //color of shadow
                          spreadRadius: 3, //spread radius
                          blurRadius: 9, // blur radius
                          offset: const Offset(0, 2),
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    child: Column(
                      children: [
                        totalDetails('\$460', 'Subtotal'),
                        totalDetails('\$40', 'Taxes'),
                        totalDetails('\$480', 'Total'),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CardPayment()));
                          },
                          child: const CustomButton(
                            buttonText: 'Next',
                            width: 300,
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
