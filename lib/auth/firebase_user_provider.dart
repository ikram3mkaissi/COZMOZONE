import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CozmozoneFirebaseUser {
  CozmozoneFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CozmozoneFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CozmozoneFirebaseUser> cozmozoneFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CozmozoneFirebaseUser>(
      (user) {
        currentUser = CozmozoneFirebaseUser(user);
        return currentUser!;
      },
    );
