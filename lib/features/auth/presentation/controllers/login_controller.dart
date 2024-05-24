import 'package:get/get.dart';
import 'package:package_auth/my_auth_repository.dart';

import '../../domain/use_cases/login_user_case.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>();
  final LoginUseCase _loginUseCase;

  LoginController(this._loginUseCase);

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () async {
      user.value = await _loginUseCase.execute(email, password);
      print(user.value?.name);
      isLoading.value = false;
    });
  }
}
