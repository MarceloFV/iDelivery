import 'package:delivery_app/app/data/models/product.dart';
import 'package:delivery_app/app/data/providers/product_provider.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class MainController extends GetxController {
  final ProductProvider productProvider;
  MainController({
    @required this.productProvider,
  });

  @override
  void onInit() {
    getProductList();
    super.onInit();
  }

  final _productList = <ProductModel>[].obs;

  List<ProductModel> get productList => _productList;

  getProductList() async {
    // _productList.assignAll(await productProvider.getProducts());
  }
}
