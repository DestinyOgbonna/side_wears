// import 'package:building_ui/exports/exports.dart';

// class PaymentFlowModel{

// void _processPayment() {
//     try {
//       PaystackPayManager(context: context)
//         ..setSecretKey("sk_test_29a6cb1c30bc57811933cb6e55b21db136cec1dc")
// // Your company Image
//         ..setCompanyAssetImage(const Image(
//           image: NetworkImage(
//               "https://res.cloudinary.com/acctgen1/image/upload/v1612393902/TECH2-01_vw1fvg.png"),
//         ))
//         ..setAmount(100000) 
// // you need to add two zeros at the end e.g 100000 = N1,000.00
// // you can set your own unique transaction reference, here am using timestamp
//         ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
//         ..setCurrency("NGN") // Set currency, the platform only has three currencies, when registering the
// //list of countries listed is the currency that is available for you to use
//         ..setEmail("egbulonudestiny@gmail.com") // user email address and information
//         ..setFirstName("Ogbonna")
//         ..setLastName("Destiny")
//         ..setMetadata(
//           {
//             "custom_fields": [
//               {
//                 "value": "TechWithSam", // set this your company name
//                 "display_name": "Payment_to",
//                 "variable_name": "Payment_to"
//               }
//             ]
//           },
//         )
//         ..onSuccesful(_onPaymentSuccessful)
//         ..onPending(_onPaymentPending)
//         ..onFailed(_onPaymentFailed)
//         ..onCancel(_onCancel)
//         ..initialize();
//     } catch (error) {
//       print('Payment Error ==> $error');
//     }
//   }

//   void _onPaymentSuccessful(Transaction transaction) {
//     print('Transaction succesful');
//     print(
//         "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
//   }

//   void _onPaymentPending(Transaction transaction) {
//     print('Transaction Pending');
//     print("Transaction Ref ${transaction.refrenceNumber}");
//   }

//   void _onPaymentFailed(Transaction transaction) {
//     print('Transaction Failed');
//     print("Transaction message ==> ${transaction.message}");
//   }

//   void _onCancel(Transaction transaction) {
//     print('Transaction Cancelled');
//   }

// }