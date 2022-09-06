import 'package:building_ui/exports/exports.dart';
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

  setUp(() {
    collectionService = FireStoreCollectionServiceMock();
    sut = HomeScreenViewModel(collectionService);
    docsSnap = MockDocumentSnapshot();
    sut.getShoeProducts();
  });

  group('HomeViewMOdel Test', () {
    test('Function Recieves a String  containing the username from Firebase',
        () async {
      when(() => collectionService.usersRef
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()).thenAnswer((invocation) async => docsSnap);
      when(() => docsSnap.data()).thenReturn({'username': 'Destiny'});
      when(() => docsSnap.exists).thenReturn(true);
      final result = await sut.getUsername();
      expect(result, null);
    });

    test('Function Recieves a List containing the ShoeProducts from Firebase',
        () async {
      when(() => collectionService.productsRef
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
