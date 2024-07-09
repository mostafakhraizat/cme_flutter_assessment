import 'package:cme_flutter_assessment/core/utils/enum/authentication_enums.dart';
import 'package:cme_flutter_assessment/core/utils/mixin/logger_mixin.dart';
import 'package:cme_flutter_assessment/src/data/interface/authentication_interface.dart';
import 'package:cme_flutter_assessment/src/data/model/authentication_response.dart';
import 'package:cme_flutter_assessment/src/data/model/user.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServiceManager
    with LoggerMixin
    implements AuthenticationInterface {
  @override
  Future<AuthenticationResponse> authenticateWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account == null) {
        return AuthenticationResponse(
            AuthenticationResponseState.unknownError, null);
      }
      return AuthenticationResponse(
          AuthenticationResponseState.success, User(account.email));
    } on PlatformException catch (e) {
      logError(e.toString(), stackTrace: StackTrace.current);
      if (e.code == "network_error") {
        return AuthenticationResponse(
            AuthenticationResponseState.networkError, null);
      }
      return AuthenticationResponse(AuthenticationResponseState.apiError, null);
    } catch (e) {
      logError(e.toString(), stackTrace: StackTrace.current);
      return AuthenticationResponse(
          AuthenticationResponseState.unknownError, null);
    }
  }
}
