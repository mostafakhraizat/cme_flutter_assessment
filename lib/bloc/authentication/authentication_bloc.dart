import 'package:bloc/bloc.dart';
import 'package:cme_flutter_assessment/data/repository/authentication_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationService =
      AuthenticationRepository();
  AuthenticationBloc() : super(AuthenticationInitial()) {
    //events stream listeners
    on<GoogleAuthenticateEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      await Future.delayed(Duration(seconds: 3));
      final response = _authenticationService.authenticate();
      emit(AuthenticationInitial());
    });
  }
  static AuthenticationBloc instance(context) => BlocProvider.of(context);
}
