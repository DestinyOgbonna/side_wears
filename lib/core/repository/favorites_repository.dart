import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';

class FavoriteRepository {
  Future<Product?> addToFavorite(
      {required CollectionReference referenceProduct,
      required String productId,
      required CollectionReference referenceUser}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getProduct =
          await referenceProduct.doc(productId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getProduct.exists) {
        DocumentSnapshot<Map<String, dynamic>> getSelectedProductsForCart =
            getProduct;
        final addProductDetails =
            Product.fromFirestore(getSelectedProductsForCart);
        referenceUser
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Favorites')
            .doc(productId)
            .set({
          'product_name': addProductDetails.productName,
          'product_price': addProductDetails.productPrice,
          'product_description': addProductDetails.productDescription,
          'product_image': addProductDetails.productImages,
        });
        Fluttertoast.showToast(
            msg: 'Added to Favorites',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.SNACKBAR,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
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

  Future<void> removeFromFavorite(
      {required CollectionReference reference,
      required String productId}) async {
    reference
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Favorites')
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

  Future<List<Product>> getProductsFromFavorite(
      {required CollectionReference reference}) async {
    List<Product> cartProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getCartItems = await reference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favorites')
          .get();
      if (getCartItems.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> showCartItems =
            getCartItems.docs;
        final displayCartItems =
            showCartItems.map((cart) => Product.fromFirestore(cart)).toList();
        cartProducts = displayCartItems;
      }
    } catch (e) {
      rethrow;
    }
    return cartProducts;
  }
}

final favoriteRepository = Provider<FavoriteRepository>((ref) {
  return FavoriteRepository();
});
