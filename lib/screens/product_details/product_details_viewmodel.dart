import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/core/repository/cart_repository.dart';
import 'package:building_ui/core/repository/favorites_repository.dart';
import 'package:building_ui/core/repository/products_repository.dart';

class ProductDetailsViewModel extends StateNotifier<ProductDetailsViewState> {
  ProductDetailsViewModel(this._firestoreCollectionService,
      this.productsRepository, this.cartRepository, this.favoriteRepository)
      : super(ProductDetailsViewState(productModel: Product()));
  final FirestoreCollectionService _firestoreCollectionService;
  final ProductsRepository productsRepository;
  final CartRepository cartRepository;
  final FavoriteRepository favoriteRepository;

  String? prodID;

  productId(String? selectedprodID) {
    prodID = selectedprodID;
  }

  void increaseItemCount() {
    state = state.copyWith(myCount: state.myCount = state.myCount + 1);
  }

  void decreaseItemCount() {
    state = state.copyWith(myCount: state.myCount = state.myCount - 1);
  }

//*  GETTING PRODUCT DETAILS FROM SHOES SECTION

  Future<Product?> getShoes() async {
    try {
      return await productsRepository.getProductDetails(
          reference: _firestoreCollectionService.shoesRef, productId: prodID!);
    } catch (e) {
      rethrow;
    }
  }

//*  GETTING PRODUCT DETAILS FROM WristWatch SECTION
  Future<Product?> getWristWatch() async {
    try {
      return await productsRepository.getProductDetails(
          reference: _firestoreCollectionService.watchesRef,
          productId: prodID!);
    } catch (e) {
      rethrow;
    }
  }

//*  GETTING PRODUCT DETAILS FROM HOODIES SECTION

  Future<Product?> getHoodies() async {
    try {
      return await productsRepository.getProductDetails(
          reference: _firestoreCollectionService.hoodieRef, productId: prodID!);
    } catch (e) {
      rethrow;
    }
  }

//*ADD HOODIES TO CART
  Future<Product?> addHoodiesToCart(BuildContext context) async {
    try {
      return await cartRepository.addToCart(
          referenceProduct: _firestoreCollectionService.hoodieRef,
          productId: prodID!,
          referenceUser: _firestoreCollectionService.usersRef, context: context);
    } catch (e) {
      rethrow;
    }
  }

  //*ADD HOODIES TO Shoes
  Future<Product?> addShoesToCart(BuildContext context) async {
    try {
      return await cartRepository.addToCart(
          referenceProduct: _firestoreCollectionService.shoesRef,
          productId: prodID!,
          referenceUser: _firestoreCollectionService.usersRef, context: context);
    } catch (e) {
      rethrow;
    }
  }

  //*ADD HOODIES TO Watches
  Future<Product?> addWatchesToCart(BuildContext context) async {
    try {
      return await cartRepository.addToCart(
          referenceProduct: _firestoreCollectionService.watchesRef,
          productId: prodID!,
          referenceUser: _firestoreCollectionService.usersRef, context: context);
    } catch (e) {
      rethrow;
    }
  }

  Future removeFromFavorite() async {
    try {
      return await favoriteRepository.removeFromFavorite(
          reference: _firestoreCollectionService.usersRef, productId: prodID!);
    } catch (e) {
      rethrow;
    }
  }

//!NEEDS TO BE REPEATED

  Future toggleFavouriteIcon() async {
    state = state.copyWith(isSelected: !state.isSelected);
    if (state.isSelected != true) {
      try {
        final DocumentSnapshot<Map<String, dynamic>> getUser =
            await _firestoreCollectionService.watchesRef.doc(prodID).get()
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
          _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection('Favorites')
              .doc('$prodID')
              .set(
            {
              'product_name': showProductDetails.productName,
              'product_price': showProductDetails.productPrice,
              'product_description': showProductDetails.productDescription,
              'product_image': showProductDetails.productImages,
            },
          );
          Fluttertoast.showToast(
              msg: 'Added to Favourite',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.SNACKBAR,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          return showProductDetails;
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
    } else {
      _firestoreCollectionService.usersRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('Favorites')
          .doc('$prodID')
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
}

class ProductDetailsViewState {
  final String? productId;
  LoadingState loadingState;
  Product productModel;
  bool isSelected;
  int myCount;

  ProductDetailsViewState({
    this.myCount = 0,
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
    int? myCount,
  }) {
    return ProductDetailsViewState(
        productId: productId ?? this.productId,
        isSelected: isSelected ?? this.isSelected,
        productModel: productModel ?? this.productModel,
        loadingState: loadingState ?? this.loadingState,
        myCount: myCount ?? this.myCount);
  }
}
