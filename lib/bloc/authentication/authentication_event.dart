part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class GoogleAuthenticateEvent extends AuthenticationEvent {
  final BuildContext context;
  GoogleAuthenticateEvent(
    this.context,
  );
}

class CheckSessionAuthenticationEvent extends AuthenticationEvent {
  final BuildContext context;
  CheckSessionAuthenticationEvent(
    this.context,
  );
}
