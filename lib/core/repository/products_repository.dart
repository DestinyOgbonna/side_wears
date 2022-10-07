import 'package:building_ui/core/exports/exports.dart';

import '../model/product_model.dart';

class ProductsRepository {
  ProductsRepository();

  Future<Product?> getProductDetails(
      {required CollectionReference reference,
      required String productId}) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getWatchProducts =
          await reference.doc(productId).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getWatchProducts.exists) {
        DocumentSnapshot<Map<String, dynamic>> getWatchDetail =
            getWatchProducts;
        final showProductDetails = Product.fromFirestore(getWatchDetail);
        return showProductDetails;
      }
      return null;
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

  Future<List<Product>> getProducts(
      {required CollectionReference reference}) async {
    List<Product> shoeProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getProducts =
          await reference.get() as QuerySnapshot<Map<String, dynamic>>;
      if (getProducts.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> storeProducts =
            getProducts.docs;
        final product =
            storeProducts.map((storeProduct) => Product.fromFirestore(storeProduct)).toList();
        shoeProducts = product;
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
    return shoeProducts;
  }
}

final productRepositiry = Provider<ProductsRepository>((ref) {
  return ProductsRepository();
});
