import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/custom_error.dart';
import '../../../services/auth_service.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthService authService;

  SignupCubit({
    required this.authService,
  }) : super(SignupState.initial());

// SIGN UP METHOD
  Future<void> signup({
    required String name,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(state.copyWith(signupStatus: SignupStatus.submitting));

    try {
      await authService.signUp(
        name: name,
        lastName: lastName,
        email: email,
        password: password,
      );
      emit(state.copyWith(signupStatus: SignupStatus.success));
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signupStatus: SignupStatus.error,
          error: e,
        ),
      );
    }
  }

  // // Convert anonymous user to a permanent user
  // Future<void> convertAnonymousUser({
  //   required String name,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // }) async {
  //   emit(state.copyWith(signupStatus: SignupStatus.submitting));

  //   try {
  //     await authService.convertAnonymousUser(
  //       name: name,
  //       lastName: lastName,
  //       email: email,
  //       password: password,
  //     );
  //     emit(state.copyWith(signupStatus: SignupStatus.success));
  //   } on CustomError catch (e) {
  //     emit(
  //       state.copyWith(
  //         signupStatus: SignupStatus.error,
  //         error: e,
  //       ),
  //     );
  //   }
  // }
}
