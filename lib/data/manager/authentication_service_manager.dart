import 'package:cme_flutter_assessment/data/interface/authentication_interface.dart';
import 'package:cme_flutter_assessment/model/user.dart';
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
