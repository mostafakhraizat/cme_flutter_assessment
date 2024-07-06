import 'package:cme_flutter_assessment/data/manager/authentication_service_manager.dart';
import 'package:cme_flutter_assessment/model/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  authenticateWithGoogle() =>
      AuthenticationServiceManager().authenticateWithGoogle();
}
