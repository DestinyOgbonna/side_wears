import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/screens/Product%20Details/product_details_viewmodel.dart';

class FavoriteViewModel extends StateNotifier<FavoriteViewState> {
  FavoriteViewModel(this._firestoreCollectionService, this.prod)
      : super(FavoriteViewState());
  final FirestoreCollectionService _firestoreCollectionService;

  ProductDetailsViewModel prod;

  Future<List<Product>> getProductsFromFavorite() async {
    List<Product> cartProducts = [];
    try {
      final QuerySnapshot<Map<String, dynamic>> getCartItems =
          await _firestoreCollectionService.usersRef
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
    } catch (e) {}

    return cartProducts;
  }

  Future removeFromFavorite() async {
    try {
      _firestoreCollectionService.usersRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favorites')
          .doc(prod.prodID) //!TODO ID NOT FOUND
          .delete();
      Fluttertoast.showToast(
          msg: 'Removed From Favorites',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      rethrow;
    }
  }
}

class FavoriteViewState {}
