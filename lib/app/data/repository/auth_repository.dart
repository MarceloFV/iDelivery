import 'package:delivery_app/app/data/providers/auth_provider.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  final AuthProvider provider;

  AuthRepository({@required this.provider}) : assert(provider != null);

  Future<String> login(email, password) => provider.login(email, password);

  bool isUserConnected() => provider.isUserConnected();

  String getUID() => provider.getUID();

  register(String email, String password) => provider.register(email, password);
}
