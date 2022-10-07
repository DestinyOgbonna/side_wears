import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';

class CartViewModel extends StateNotifier<CartViewState> {
  CartViewModel(
      this._firestoreCollectionService, this._firebaseAuthService, this.prod)
      : super(CartViewState());
  final FirestoreCollectionService _firestoreCollectionService;
  final FirebaseAuthService _firebaseAuthService;
  ProductDetailsViewModel prod;
  num totalPrice = 0;

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
        for (int i = 0; i < displayCartItems.length; i++) {
          totalPrice += displayCartItems[i].productPrice!;
        }
        cartProducts = displayCartItems;
      }
    } catch (e) {
      rethrow;
    }
    return cartProducts;
  }
}

class CartViewState {}
