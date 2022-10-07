import 'package:building_ui/core/exports/exports.dart';
import 'package:building_ui/core/repository/products_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// ignore: subtype_of_sealed_class
class MockDocumentSnapshot extends Mock implements DocumentSnapshot {}

class FireStoreCollectionServiceMock extends Mock
    implements FirestoreCollectionService {}

void main() {
  late HomeScreenViewModel sut;
  late DocumentSnapshot docsSnap;
  late FirestoreCollectionService collectionService;
  late ProductsRepository productsRepository;
  late UserModel userModel;

  setUp(() {
    collectionService = FireStoreCollectionServiceMock();
    productsRepository = ProductsRepository();
    sut = HomeScreenViewModel(collectionService, productsRepository);
    docsSnap = MockDocumentSnapshot();
    userModel = UserModel();
  });

  group('HomeViewModel Test', () {
    test(
        'Function Recieves a String of type UserModel  containing the username from Firebase',
        () async {
      when(() => collectionService.usersRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()).thenAnswer((invocation) async => docsSnap);
      when(() => docsSnap.data()).thenReturn({'username': 'Destiny'});
      when(() => docsSnap.exists).thenReturn(true);
      final result = await sut.getUsername();
      expect(result, userModel);
    });

    test('Function Recieves a list containing the ShoeProducts from Firebase',
        () async {
      when(() => collectionService.shoesRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()).thenAnswer((invocation) async => docsSnap);
      when(() => docsSnap.data()).thenReturn([]);
      when(() => docsSnap.exists).thenReturn(true);
      final getList = await sut.getShoeProducts();
      expect(getList, []);
    });

    //  test('Function Recieves a List containing the ShoeProducts from Firebase',
    //     () async {
    //   when(() => collectionService.productsRef
    //       .doc(FirebaseAuth.instance.currentUser!.uid)
    //       .get()).thenAnswer((invocation) async => docsSnap);
    //   when(() => docsSnap.data()).thenReturn(['nike', 'Hermes', 'adiddas', 'newBalance']);
    //   when(() => docsSnap.exists).thenReturn(true);
    //   final getList = await sut.getShoeProducts().whenComplete(() =>['nike', 'Hermes', 'adiddas', 'newBalance',] );
    //   expect(getList, ['nike', 'Hermes', 'adiddas', 'newBalance',], reason: 'Returns a List of products from firebase');
    // });
  });
}
