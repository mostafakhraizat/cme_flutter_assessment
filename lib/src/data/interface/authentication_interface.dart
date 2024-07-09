import 'package:cme_flutter_assessment/src/data/model/user.dart';

abstract interface class AuthenticationInterface {
  Future<User?> authenticateWithGoogle();
}
