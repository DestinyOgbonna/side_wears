import 'package:building_ui/exports/exports.dart';
import 'package:building_ui/model/product_model.dart';

class HomeScreenViewModel extends StateNotifier<HomeScreenState> {
  HomeScreenViewModel()
      : super(HomeScreenState(userModel: UserModel(), productModel: Product()));

  final FirestoreCollectionService _firestoreCollectionService =
      FirestoreCollectionService();

  //*Getting the user name of the logged in user
  Future getUsername() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> getUser =
          await _firestoreCollectionService.usersRef
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get() as DocumentSnapshot<Map<String, dynamic>>;
      if (getUser.exists) {
        state = state.copyWith(loadingState: LoadingState.loading);
        final loggedInUsername = UserModel.fromFirestore(getUser);
        state = state.copyWith(
            loadingState: LoadingState.success, userModel: loggedInUsername);
        return loggedInUsername;
      }
    } catch (e) {
      state = state.copyWith(loadingState: LoadingState.error);
    }
  }

//*Getting the user name of the logged in user
  // Future getShoeProducts() async {
  //   try {
  //     final  getProducts =
  //         await _firestoreCollectionService.productsRef
  //             .get() as DocumentSnapshot<Map<String, dynamic>>;
  //     if (getProducts.exists) {
  //          print('!!!!!!!!!!! ${getProducts}!!!!!!!!!!!!!!!!');
  //     //  state = state.copyWith(loadingState: LoadingState.loading);
  //      // final getShoes = Product.fromFirestore(getProducts);
  //       // state = state.copyWith(
  //       //     loadingState: LoadingState.success, productModel: getShoes);
  //      // print('!!!!!!!!!!! ${getShoes.productName}!!!!!!!!!!!!!!!!');
  //      // return getShoes;
  //     }
  //   } catch (e) {
  //    // state = state.copyWith(loadingState: LoadingState.error);
  //   }
  // }

  Future<void> getData() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestoreCollectionService.productsRef.get();
      if (querySnapshot.docs.isNotEmpty) {
      //  state = state.copyWith(loadingState: LoadingState.loading);
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
        print(allData);
      }
    } catch (e) {}
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
