import 'package:shopitemapp/services/database.dart';
import 'package:shopitemapp/signAndregister/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Ovaj file ce nam sluziti, da se anonimno logiramo, logiramo email/pass, da se registriramo i odjavimo

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }
//  Future signInAnon() async {
//    try{
//      AuthResult result = await _auth.signInAnonymously();
//      FirebaseUser user = result.user;
//      return _userFromFirebaseUser(user);
//    }
//    catch(e) {
//      print(e.toString());
//      return null;
//    }
//  }

  //sign on


  Future signInWithUserNameAndPassword(String username, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }


  //register on
  Future registerWithUserNameAndPassword(String username, String password) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: username, password: password);
      FirebaseUser user = result.user;

      //create new document for the user with uid
      await DataBaseService(uid: user.uid).updateUserData('Novi clan', 0.0);

      return _userFromFirebaseUser(user);
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out

  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
}
