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

  Future getProducts() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.productsRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(
          loadingState: LoadingState.loading,
        );
        final showProductDetails = Product.fromFirestore(getUser);
        state = state.copyWith(
          loadingState: LoadingState.success,
          productModel: showProductDetails,
        );
        return showProductDetails;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
  }

  Future<Product?> addToCart() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.productsRef.doc(prodID).get()
              as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(
          loadingState: LoadingState.loading,
        );
        final showProductDetails = Product.fromFirestore(getUser);
        state = state.copyWith(
          loadingState: LoadingState.success,
          productModel: showProductDetails,
        );
        final docRef = _firestoreCollectionService.usersRef
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('Cart')
            .doc('$prodID')
            .set({
          'product_name': showProductDetails.productName,
          'product_price': showProductDetails.productPrice,
          'product_description': showProductDetails.productDescription,
          'product_image': showProductDetails.productImages,
        });
        return showProductDetails;
      }
    } catch (e) {
      state = state.copyWith(
        loadingState: LoadingState.error,
      );
    }
  }

  toggleFavouriteIcon() {
    state = state.copyWith(isSelected: !state.isSelected);
    print('${state.isSelected}');
  }
}

class ProductDetailsViewState {
  final String? productId;
  LoadingState loadingState;
  Product productModel;
  bool isSelected;

  ProductDetailsViewState({
    this.isSelected = true,
    this.productId = '',
    this.loadingState = LoadingState.loading,
    required this.productModel,
  });

  ProductDetailsViewState copyWith({
    String? productId,
    Product? productModel,
    LoadingState? loadingState,
    bool? isSelected,
  }) {
    return ProductDetailsViewState(
      productId: productId ?? this.productId,
      isSelected: isSelected ?? this.isSelected,
      productModel: productModel ?? this.productModel,
      loadingState: loadingState ?? this.loadingState,
    );
  }
}
