import 'dart:developer';

import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class CartViewModel extends StateNotifier<CartViewState> {
  CartViewModel(this._firestoreCollectionService) : super(CartViewState());
  final FirestoreCollectionService _firestoreCollectionService;

  Future<List<Product>> getProductsFromCart() async {
    List<Product> cartProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getCartItems =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Cart')
              .get();
      if (getCartItems.docs.isNotEmpty) {
        List<QueryDocumentSnapshot<Map<String, dynamic>>> showCartItems =
            getCartItems.docs;
        final displayCartItems =
            showCartItems.map((cart) => Product.fromFirestore(cart)).toList();
        cartProducts = displayCartItems;
      }
    } catch (e) {}

    return cartProducts;
  }
}

class CartViewState {}
