import 'package:cme_flutter_assessment/core/utils/enum/authentication_enums.dart';
import 'package:cme_flutter_assessment/src/data/model/user.dart';

class AuthenticationResponse {
  final AuthenticationResponseState authenticationResponseState;
  final User? user;
  AuthenticationResponse(
    this.authenticationResponseState,
    this.user,
  );
}
