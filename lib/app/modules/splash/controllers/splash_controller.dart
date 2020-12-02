import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  final UserRepository repository ;

  SplashController({@required this.repository}) : assert(repository != null);

  RxBool isUserConnected = false.obs;

  Worker worker;

  @override
  void onInit() {
    worker = ever(isUserConnected, getUser);
    isUserConnected.value = repository.isUserConnected();
    super.onInit();
  }

  getUser(bool val) async {
    final userModel = await repository.getUser(repository.getUserId());
    if (userModel != null && val == true) {
      Get.offAllNamed(Routes.HOME, arguments: {'user': userModel});
    }
    if (userModel == null && val == false) Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onClose() {
    worker.dispose();
  }
}
