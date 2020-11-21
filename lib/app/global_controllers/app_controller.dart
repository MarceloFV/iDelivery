import 'package:delivery_app/app/data/models/user.dart';
import 'package:delivery_app/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
//TODO: Passar o user atraves da spleshScreen ou do login/register
  UserRepository userRepository = UserRepository();

  UserModel _user;
  set user(UserModel u) => this._user = u;
  UserModel get user => this._user;

  @override
  void onInit() {
    user = _getUser();
    super.onInit();
  }

  _getUser() {
    return userRepository.getUserMocked();
  } // TODO: Remover isso e passar pra pagina inicial do app
}
