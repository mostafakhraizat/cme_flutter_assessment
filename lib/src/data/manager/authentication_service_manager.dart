import 'package:cme_flutter_assessment/src/data/interface/authentication_interface.dart';
import 'package:cme_flutter_assessment/src/data/model/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationServiceManager implements AuthenticationInterface {
  @override
  Future<User?> authenticateWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    if (account == null) {
      return null;
    }
    return User(account.email);
  }
}
