import 'package:delivery_app/app/data/repository/auth_repository.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:delivery_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  final UserRepository userRepository;
  final AuthRepository authRepository;

  SplashController({
    @required this.userRepository,
    @required this.authRepository,
  }) : assert(userRepository != null);

  RxBool isUserConnected = false.obs;

  Worker worker;

  @override
  void onInit() {
    worker = ever(isUserConnected, getUser);
    isUserConnected.value = authRepository.isUserConnected();
    super.onInit();
  }

  getUser(bool val) async {
    if (!val) return Get.offAllNamed(Routes.LOGIN);

    String uid = authRepository.getUID(); // TODO: Essa funçao ta bugando, recebendo email deletado
    var user = await userRepository.getCurrentUser(uid);

//TODO: Implement case where the user is null cause they tryed to login using store email
    if (user == null) return Get.offAllNamed(Routes.LOGIN);

    if (user != null)
      return Get.offAllNamed(Routes.HOME, arguments: {'user': user});
  }

  @override
  void onClose() {
    worker.dispose();
  }
}
