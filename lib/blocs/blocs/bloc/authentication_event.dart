part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AuthStateChangedEvent extends AuthenticationEvent {
  final User? user;

  const AuthStateChangedEvent({this.user});

  @override
  List<Object?> get props => [user];
}

class SignOutEvent extends AuthenticationEvent {}

// delete account event
class DeleteAccountEvent extends AuthenticationEvent {
  final String password;

  const DeleteAccountEvent({required this.password});

  @override
  List<Object?> get props => [password];
}
