// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
  anonymous,
}

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  final fb_auth.User? user;

  const AuthenticationState({
    required this.authStatus,
    this.user,
  });

  factory AuthenticationState.unknown() {
    return const AuthenticationState(authStatus: AuthStatus.unknown);
  }

  @override
  List<Object?> get props => [authStatus, user];

  @override
  String toString() => 'AuthState { authStatus: $authStatus, user: $user }';

  AuthenticationState copyWith({
    AuthStatus? authStatus,
    fb_auth.User? user,
  }) {
    return AuthenticationState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
    );
  }
}
