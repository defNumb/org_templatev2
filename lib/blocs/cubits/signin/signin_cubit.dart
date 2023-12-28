import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/custom_error.dart';
import '../../../services/auth_service.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthService authService;
  SigninCubit({required this.authService}) : super(SigninState.initial());

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signinStatus: SigninStatus.submitting));
    try {
      await authService.signIn(email: email, password: password);
      emit(state.copyWith(signinStatus: SigninStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          error: e,
        ),
      );
    }
  }

  // // Anon signin
  // Future<void> anonSignin() async {
  //   emit(state.copyWith(signinStatus: SigninStatus.submitting));
  //   try {
  //     await authRepository.anonymousSignin();
  //     emit(
  //       state.copyWith(
  //         signinStatus: SigninStatus.success,
  //       ),
  //     );
  //   } on CustomError catch (e) {
  //     emit(
  //       state.copyWith(
  //         signinStatus: SigninStatus.error,
  //         error: e,
  //       ),
  //     );
  //   }
  // }
}
