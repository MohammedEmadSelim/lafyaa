import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/Repository/auth_repo.dart';

part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit() : super(AuthCubitInitial());

  void loginCubitFun(String email, String pass) async {
    final res = await LoginClass().loginFun(email, pass);

    final status = res.data['status'] as bool;
    if (status) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = res.data['data']['token'] as String ;
      await prefs.setString('token', token);
      emit(LogedinSuccessful());
    }
  }
}
