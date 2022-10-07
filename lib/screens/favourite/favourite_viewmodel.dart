import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/model/product_model.dart';
import 'package:building_ui/core/repository/favorites_repository.dart';

class FavoriteViewModel extends StateNotifier<FavoriteViewState> {
  FavoriteViewModel(
    this._firebaseAuthService,
    this._firestoreCollectionService,
    this.favoriteRepository,
  ) : super(FavoriteViewState());
  final FirestoreCollectionService _firestoreCollectionService;
  final FirebaseAuthService _firebaseAuthService;
  final FavoriteRepository favoriteRepository;

  Future<List<Product>> getProductsFromFavorite() async {
    try {
      return await favoriteRepository.getProductsFromFavorite(
          reference: _firestoreCollectionService.usersRef);
    } catch (e) {
      rethrow;
    }

  }

//TODO Working need modification
  Future<void> deleteProductsFromFavorite() async {
    FirebaseFirestore.instance.collection('Favorites').get().then((value) {
      for (DocumentSnapshot ds in value.docs) {
        ds.reference.delete();
      }
    });
  }
}

class FavoriteViewState {}
