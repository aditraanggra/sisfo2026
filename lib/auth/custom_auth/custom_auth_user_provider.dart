import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class SisfoAuthUser {
  SisfoAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<SisfoAuthUser> sisfoAuthUserSubject =
    BehaviorSubject.seeded(SisfoAuthUser(loggedIn: false));
Stream<SisfoAuthUser> sisfoAuthUserStream() =>
    sisfoAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
