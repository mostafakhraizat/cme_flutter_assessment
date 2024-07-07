import 'package:cme_flutter_assessment/data/manager/authentication_service_manager.dart';

class AuthenticationRepository {
  authenticateWithGoogle() =>
      AuthenticationServiceManager().authenticateWithGoogle();
}
