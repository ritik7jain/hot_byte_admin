import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';
class AuthService{

final FirebaseAuth _auth = FirebaseAuth.instance;
bool authSignedIn;
String uid;
String userEmail;

  Users _userFromFirebaseUser(User user){
    return user != null? Users(uid:user.uid): null;
  }

   Stream <Users> get user{
     return _auth.authStateChanges()
     .map(_userFromFirebaseUser);
     //.map((FirebaseUser user)=> _userFromFirebaseUser(user));
   }

Future registerWithEmailPassword(String email, String password) async {
 
  try{
     await Firebase.initializeApp();
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User user = userCredential.user;

  if (user != null) {

    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return _userFromFirebaseUser(user);
  }

  }
  on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
}
  catch(e){
    print(e.toString());
    return null;
  }
}

Future signInWithEmailPassword(String email, String password) async {
try{
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  final User user = userCredential.user;

  if (user != null) {
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', true);

   return _userFromFirebaseUser(user);
  }


}
on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
catch(e){
  print(e.toString());
  return null;
}
}

Future<String> signOut() async {
  try{
    await _auth.signOut();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('auth', false);

  uid = null;
  userEmail = null;

  return 'User signed out';

  }
  catch(e){
    print(e.toString());
    return null;
  }
}

}
