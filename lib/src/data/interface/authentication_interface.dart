import 'package:cme_flutter_assessment/src/data/model/authentication_response.dart';

abstract interface class AuthenticationInterface {
  Future<AuthenticationResponse> authenticateWithGoogle();
}
