import 'package:cme_flutter_assessment/data/service/authentication_service.dart';

class AuthenticationRepository implements AuthenticationService {
  Future authenticate() => AuthenticationService.authenticate();
}
