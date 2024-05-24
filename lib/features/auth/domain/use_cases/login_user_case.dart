import 'package:package_auth/my_auth_repository.dart';

class LoginUseCase {
  // final AuthRepository _authRepository;

  // LoginUseCase(this._authRepository);

  Future<UserModel?> execute(String email, String password) {
    return AuthRepository().login(email, password);
  }
}
