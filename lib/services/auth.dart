
import 'package:break_bread/models/userUid.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // create user object based on FirebaseUser
  UserUID _userFromFirebaseUser(auth.User? user){
    return UserUID(uid: user!.uid);
  }
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ]
  );

  // auth change user stream
  Stream<UserUID> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in with google
  Future signInGoogle() async{
    try{
      final GoogleSignInAccount googleUser = (await _googleSignIn.signIn())!;
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken
      );
      final authresult = await _auth.signInWithCredential(credential);
      // ignore: unused_local_variable
      List<String> name = googleUser.displayName!.split(' ');
      final SharedPreferences prefs = await _prefs;
      prefs.setString('name', googleUser.displayName??"");
      prefs.setString('email', googleUser.email);
      prefs.setString('userImageURL', googleUser.photoUrl??"");
      //await DatabaseService(uid: authresult.user.uid,email: googleUser.email).updateStudent(name[0],name[1],10,'ADMIN');
      return _userFromFirebaseUser(authresult.user);
    } 
    catch(e){
      print("ERROR IN AUTHENTICATION: "+e.toString());
      return null;
    }
  }
  
  Future signOut() async{
    try{
      final SharedPreferences prefs = await _prefs;
      prefs.remove('name');
      prefs.remove('email');
      prefs.remove('userImageURL');
      _googleSignIn.signOut();
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}