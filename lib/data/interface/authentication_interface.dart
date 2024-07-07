import 'package:cme_flutter_assessment/data/model/user.dart';

abstract interface class AuthenticationInterface {
  Future<User?> authenticateWithGoogle();
}
