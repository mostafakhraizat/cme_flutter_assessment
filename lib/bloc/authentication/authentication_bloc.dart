import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/data/interface/authentication_interface.dart';
import 'package:cme_flutter_assessment/data/interface/secure_storage_interface.dart';
import 'package:cme_flutter_assessment/data/repository/authentication_repository.dart';
import 'package:cme_flutter_assessment/data/repository/secure_storage_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  final SecureStorageRepository secureStorageRepository;

  AuthenticationBloc(
      {required this.authenticationRepository,
      required this.secureStorageRepository})
      : super(AuthenticationInitial()) {
    //events stream listeners
    on<CheckSessionAuthenticationEvent>((event, emit) async {
      final String? storedEmail = await secureStorageRepository.getEmail();
      if (storedEmail != null) {
        Navigator.of(event.context).pushReplacementNamed("/home");
      }
    });
    on<GoogleAuthenticateEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      final account = await authenticationRepository.authenticateWithGoogle();
      if (account == null) {
        emit(AuthenticationInitial());
        ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(content: Text("Authentication revoked")));
        return;
      }
      //store
      secureStorageRepository.setEmail(account.email);
      Navigator.pushReplacementNamed(event.context, "/home");
    });
  }
}
