import 'package:building_ui/exports/exports.dart';

class AddressPage extends ConsumerWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0.h),
          child: MyAppBar(
            isSettings: false,
            title: 'Enter Address',
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50.0.h,
                ),
                Text(
                  'Enter Address',
                  style: AppStyles.smallgreyText,
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 330.0.w,
                  child: const CustomTextField(
                    hintText: 'Home Adddress',
                    obscureText: false,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'State',
                      style: AppStyles.smallgreyText,
                    ),
                    Text(
                      'City',
                      style: AppStyles.smallgreyText,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 155.0.w,
                        child: const CustomTextField(
                          hintText: 'Enter State',
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        width: 155.0.w,
                        child: const CustomTextField(
                          hintText: 'Enter City',
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentView()));
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
    );
  }
}
