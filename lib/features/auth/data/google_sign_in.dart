import 'package:conversehub/core/config/app_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService{
  final _googleSignIn = GoogleSignIn(
    scopes: ["email", "profile"],
    serverClientId: AppConfig.serverClientId,
  );

  Future <String?> signIn() async {
    try{
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return null;
      }
      final auth = await account.authentication;
      return auth.idToken;
    } catch (e) {
      print("Error occurred while continuing with Google : $e");
      return null;
    }
  }

  Future <void> signOut() async {
      await _googleSignIn.signOut();
  }

}