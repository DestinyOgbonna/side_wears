import 'dart:developer';

import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel(this._firestoreCollectionService)
      : super(ProductDetailsViewState(productModel: Product()));
  final FirestoreCollectionService _firestoreCollectionService;

  String? prodID;

  productId(String? selectedprodID) {
    prodID = selectedprodID;
  }

  addtoCart() async {
    final docRef = _firestoreCollectionService.usersRef
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('dart')
        .doc('$prodID')
        .set({});

    log(' !!!!!!!!!!! PRODUCT DETAILS $docRef');
  }

  Future getProducts() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.productsRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(
          loadingState: LoadingState.loading,
        );
        final loggedInUsername = Product.fromFirestore(getUser);
        state = state.copyWith(
          loadingState: LoadingState.success,
          productModel: loggedInUsername,
        );
        return loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
  }
}

class ProductDetailsViewState {
  final String? productId;
  LoadingState loadingState;
  Product productModel;

  ProductDetailsViewState({
    this.productId = '',
    this.loadingState = LoadingState.loading,
    required this.productModel,
  });

  ProductDetailsViewState copyWith({
    String? productId,
    Product? productModel,
    LoadingState? loadingState,
  }) {
    return ProductDetailsViewState(
      productId: productId ?? this.productId,
      productModel: productModel ?? this.productModel,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
