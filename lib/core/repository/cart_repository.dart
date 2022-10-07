import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';

import '../../widgets/alert_dialog.dart';

class CartRepository {
  Future<Product?> addToCart(
      {required CollectionReference referenceProduct,
      required String productId,
      required CollectionReference referenceUser,required BuildContext context}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await referenceProduct.doc(productId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getSelectedProductsForCart =
            getUser;
        final addProductDetails =
            Product.fromFirestore(getSelectedProductsForCart);
        referenceUser
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Cart')
            .doc(productId)
            .set({
          'product_name': addProductDetails.productName,
          'product_price': addProductDetails.productPrice,
          'product_description': addProductDetails.productDescription,
          'product_image': addProductDetails.productImages,
        });
        Fluttertoast.showToast(
            msg: 'Added to Cart',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
               showMyAlertDialog(context);

      }
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          msg: '${e.message}',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return null;
  }

  Future<void> removeFromCart(
      {required CollectionReference reference,
      required String productId}) async {
    reference
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Cart')
        .doc(productId)
        .delete();
    Fluttertoast.showToast(
        msg: 'Removed From Favorites',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

final cartRepository = Provider<CartRepository>((ref) {
  return CartRepository();
});
