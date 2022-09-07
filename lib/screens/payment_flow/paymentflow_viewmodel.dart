import 'dart:math';

import 'package:flutterwave_standard/flutterwave.dart';

import '../../exports/exports.dart';

class PaymentViewModel extends StateNotifier<PaymentViewState> {
  PaymentViewModel() : super(PaymentViewState());

  Future<void> makePaymentWithFlutterWave(BuildContext context) async {
    try {
      final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: FlutterwaveStyle(buttonText: 'Lord Wears Pay'),
        publicKey: 'FLWPUBK_TEST-542197666e2369c4d46eac7374bf9a30-X',
        currency: "USD",
        redirectUrl: "google.com",
        txRef: state.paymentRef!,
        amount: "3000",
        customer: Customer(
            name: 'Ogbonna Destiny',
            phoneNumber: '09069221135',
            email: 'doe@gmail.com'),
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: 'Testing Payment'),
        isTestMode: true,
      );
      final ChargeResponse response = await flutterwave.charge();
      if (response.status!.isNotEmpty) {
        print("${response.toJson()}");
        print("${response.status}");
        print("${response.transactionId}");
      } else {
        print("${response.status}");
      }
    } catch (e) {
      print('Destiny oooooooo');
    }
  }

  void getPaymentReference() {
    Random rand = Random();
    int getRandomNumber = rand.nextInt(4000);
    if (Platform.isAndroid) {
      state = state.copyWith(paymentRef: 'ANDROID$getRandomNumber');
    } else {
      state = state.copyWith(paymentRef: 'IOS$getRandomNumber');
    }
  }
}

class PaymentViewState {
  String? paymentRef;

  PaymentViewState({
    this.paymentRef,
  });
  PaymentViewState copyWith({
    String? paymentRef,
  }) {
    return PaymentViewState(
      paymentRef: paymentRef ?? this.paymentRef,
    );
  }
}
