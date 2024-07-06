import 'package:cme_flutter_assessment/model/user.dart';

abstract interface class AuthenticationInterface {
  Future<User?> authenticateWithGoogle();
}
