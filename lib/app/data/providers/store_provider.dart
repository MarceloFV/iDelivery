import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/app/data/models/store.dart';
import 'package:meta/meta.dart';

const collectionPath = 'stores';

class StoreProvider {
  final FirebaseFirestore firestore;
  StoreProvider({@required this.firestore});

  Future<List<StoreModel>> getStores() async {
    var query = await firestore.collection(collectionPath).get();
    List<StoreModel> storeList = [];
    query.docs.forEach((snap) {
      storeList.add(StoreModel.fromDocumentSnapshot(snap));
    });
    return storeList;
  }
}
