import 'package:delivery_app/app/data/models/store.dart';
import 'package:delivery_app/app/data/providers/store_provider.dart';
import 'package:meta/meta.dart';

class StoreRepository {
  final StoreProvider provider;

  StoreRepository({@required this.provider}) : assert(provider != null);

  Future<List<StoreModel>> getStores() => provider.getStores();
}
