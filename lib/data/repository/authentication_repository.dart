import 'package:cme_flutter_assessment/data/interface/authentication_interface.dart';
import 'package:cme_flutter_assessment/model/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository implements AuthenticationInterface {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Future<User?> authenticateWithGoogle() async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    if (account == null) {
      return null;
    }
    return User(account.email);
  }
}
