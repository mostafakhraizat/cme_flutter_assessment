import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/core/utils/enum/authentication_enums.dart';
import 'package:cme_flutter_assessment/resources/strings.dart';
import 'package:cme_flutter_assessment/src/data/model/authentication_response.dart';
import 'package:cme_flutter_assessment/src/data/repository/authentication_repository.dart';
import 'package:cme_flutter_assessment/src/data/repository/secure_storage_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    on<GoogleAuthenticateEvent>(
      (event, emit) async {
        emit(AuthenticationLoadingState());
        final authenticationResponse =
            await authenticationRepository.authenticateWithGoogle();
        if (authenticationResponse.authenticationResponseState ==
            AuthenticationResponseState.success) {
          //store email
          secureStorageRepository
              .setEmail(authenticationResponse.user?.email ?? "");
          Navigator.pushReplacementNamed(event.context, "/home");
        } else if (authenticationResponse.authenticationResponseState ==
            AuthenticationResponseState.apiError) {
          emit(AuthenticationErrorState(Strings.deviceUnsupported));
        } else if (authenticationResponse.authenticationResponseState ==
            AuthenticationResponseState.networkError) {
          emit(AuthenticationErrorState(Strings.networkErrorResponse));
        } else {
          emit(AuthenticationErrorState(Strings.authenticationRevoked));
        }
      },
    );
  }
}
