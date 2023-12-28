import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:org_templatev2/blocs/blocs/bloc/authentication_state.dart';
import 'package:org_templatev2/services/auth_service.dart';

part 'authentication_event.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late final StreamSubscription authSubscription;
  final AuthService authService;

  AuthenticationBloc({required this.authService})
      : super(AuthenticationState.unknown()) {
    authSubscription = authService.user.listen((User? user) {
      add(AuthStateChangedEvent(user: user));
    });
    on<AuthStateChangedEvent>(
      (event, emit) async {
        if (event.user != null) {
          // Check if the user is anonymous
          if (event.user!.isAnonymous) {
            emit(
              state.copyWith(
                authStatus: AuthStatus.anonymous,
                user: event.user,
              ),
            );
          } else {
            emit(
              state.copyWith(
                authStatus: AuthStatus.authenticated,
                user: event.user,
              ),
            );
          }
        } else {
          emit(
            state.copyWith(
              authStatus: AuthStatus.unauthenticated,
              user: null,
            ),
          );
        }
      },
    );

    // Create a signout event
    on<SignOutEvent>(
      (event, emit) async {
        await authService.signOut();
      },
    );

    // // Create a delete account event
    // on<DeleteAccountEvent>(
    //   (event, emit) async {
    //     await authService.deleteUserAccount(event.password).then(
    //       (value) {
    //         // emit new state
    //         emit(
    //           state.copyWith(
    //             authStatus: AuthStatus.unauthenticated,
    //             user: null,
    //           ),
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
