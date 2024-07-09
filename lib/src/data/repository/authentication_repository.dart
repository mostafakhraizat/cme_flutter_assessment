import 'package:cme_flutter_assessment/src/data/manager/authentication_service_manager.dart';
import 'package:cme_flutter_assessment/src/data/model/authentication_response.dart';

class AuthenticationRepository {
  Future<AuthenticationResponse> authenticateWithGoogle() async =>
      await AuthenticationServiceManager().authenticateWithGoogle();
}
