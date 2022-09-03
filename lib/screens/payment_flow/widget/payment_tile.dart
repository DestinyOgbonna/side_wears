import 'package:building_ui/exports/exports.dart';

class PaymentTile extends StatefulWidget {
  const PaymentTile({Key? key, required this.type, required this.image})
      : super(key: key);
  final String type;
  final String image;
  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  String paymentType = '';

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSet,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 60,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: ListTile(
            trailing: isTapped
                ? const Icon(
                    Icons.radio_button_checked,
                    color: AppColors.lightgreyColor,
                  )
                : const Icon(
                    Icons.radio_button_unchecked,
                    color: AppColors.lightgreyColor,
                  ),
            title: Text(
              widget.type,
              style: AppStyles.paymentText,
            ),
            leading: Image.asset(widget.image)),
      ),
    );
  }

  void isSet() {
    setState(() {
      isTapped = !isTapped;
    });
  }
}
