import 'dart:developer';

import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/core/services/firebase.dart';

import '../Product Details/product_details_viewmodel.dart';

class CartViewModel extends StateNotifier<CartViewState> {
  CartViewModel(
      this._firestoreCollectionService, this._firebaseAuthService, this.prod)
      : super(CartViewState());
  final FirestoreCollectionService _firestoreCollectionService;
  final FirebaseAuthService _firebaseAuthService;
  ProductDetailsViewModel prod;

  Future<List<Product>> getProductsFromCart() async {
    List<Product> cartProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getCartItems =
          await _firestoreCollectionService.usersRef
              .doc(_firebaseAuthService.authService.currentUser!.uid)
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

  Future<void> removeFromCart() async {
    _firestoreCollectionService.usersRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('Favorites')
        .doc(prod.prodID)
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

class CartViewState {}
