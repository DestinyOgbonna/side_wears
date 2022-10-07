import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/core/repository/products_repository.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenState> {
  HomeScreenViewModel(this._firestoreCollectionService, this.productsRepository)
      : super(
          HomeScreenState(
            userModel: UserModel(),
            productModel: Product(),
          ),
        );
  final FirestoreCollectionService _firestoreCollectionService;
  final ProductsRepository productsRepository;

  //**************************    Getting the user name of the logged in user   ***************

  Future<UserModel?> getUsername() async {
    UserModel? userDetails;
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        DocumentSnapshot<Map<String, dynamic>> getLoggedInUserName = getUser;
        final loggedInUsername = UserModel.fromFirestore(getLoggedInUserName);
        userDetails = loggedInUsername;
      }
    } catch (e) {
      rethrow;
    }
    return userDetails;
  }

//********************     Getting Shoe Products Fromt the DB  ***********************

  Future<List<Product>?> getShoeProducts() async {
    try {
      return await productsRepository.getProducts(
          reference: _firestoreCollectionService.shoesRef);
    } catch (e) {
      // state = state.copyWith(
      //   loadingState: LoadingState.error,
      // );
      rethrow;
    }
  }

  //********************     Getting Hoodies Products Fromt the DB  ***********************
  Future<List<Product>> getHoodiesProducts() async {
    try {
      return await productsRepository.getProducts(
          reference: _firestoreCollectionService.hoodieRef);
    } catch (e) {
      // state = state.copyWith(
      //   loadingState: LoadingState.error,
      // );
      rethrow;
    }
  }

  //********************     Getting Hoodies Products Fromt the DB  ***********************
  Future<List<Product>> getWearsProducts() async {
    try {
      return await productsRepository.getProducts(
          reference: _firestoreCollectionService.shirtsRef);
    } catch (e) {
      // state = state.copyWith(
      //   loadingState: LoadingState.error,
      // );
      rethrow;
    }
  }

  //********************     Getting Watches Products Fromt the DB  ***********************
  Future<List<Product>> getWatchesProducts() async {
    try {
      return await productsRepository.getProducts(
          reference: _firestoreCollectionService.watchesRef);
    } catch (e) {
      // state = state.copyWith(
      //   loadingState: LoadingState.error,
      // );
      rethrow;
    }
  }
}

class HomeScreenState {
  LoadingState loadingState;
  UserModel userModel;
  Product productModel;
  HomeScreenState(
      {this.loadingState = LoadingState.loading,
      required this.userModel,
      required this.productModel});

  HomeScreenState copyWith({
    LoadingState? loadingState,
    Product? productModel,
    UserModel? userModel,
  }) {
    return HomeScreenState(
      loadingState: loadingState ?? this.loadingState,
      userModel: userModel ?? this.userModel,
      productModel: productModel ?? this.productModel,
    );
  }
}
