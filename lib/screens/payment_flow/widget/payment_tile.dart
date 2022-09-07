import 'package:building_ui/exports/exports.dart';

class PaymentTile extends StatefulWidget {
  const PaymentTile(
      {Key? key, required this.type, required this.image, this.isTapped})
      : super(key: key);
  final String type;
  final String image;
  final void Function()? isTapped;

  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isTapped,
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
            title: Text(
              widget.type,
              style: AppStyles.paymentText,
            ),
            leading: Image.asset(widget.image)),
      ),
    );
  }
}
