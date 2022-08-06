import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:metacheck_frontend/movas/services/auth/auth_service.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/login_request.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/register_request.dart';
import 'package:movas/movas.dart';

class CreateUserReq {
  final String email;
  final String uid;

  const CreateUserReq({
    required this.email,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'uid': this.uid,
    };
  }

  factory CreateUserReq.fromMap(Map<String, dynamic> map) {
    return CreateUserReq(
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }
}

class FirebaseAuthService implements AuthService {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;

  final PublishSubject<UserE?> user$;

  FirebaseAuthService(this.user$);

  @override
  Future<void> login(LoginRequest request) async {
    final r = await auth.signInWithEmailAndPassword(
        email: request.username, password: request.password);

    await getUser(
        CreateUserReq(email: r.user?.email ?? "", uid: r.user?.uid ?? ""));
  }

  @override
  Future<void> register(RegisterRequest request) async {
    final r = await auth.createUserWithEmailAndPassword(
        email: request.email, password: request.password);

    await createUser(
        CreateUserReq(email: r.user?.email ?? "", uid: r.user?.uid ?? ""));
  }

  @override
  Future<UserE> createUser(CreateUserReq user) async {
    final doc = await db.collection("users").doc(user.uid).set(user.toMap());

    return getUser(user);
  }

  @override
  Future<UserE> getUser(CreateUserReq uid) async {
    late UserE user;

    final doc = await db.collection("users").doc(uid.uid).get();

    if (doc.exists) {
      user = UserE.fromFirestore(doc);
    } else {
      return createUser(uid);
    }
    user$.add(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
    user$.add(null);
  }

  @override
  Future<UserE?> isLoggedIn() async {
    final user = auth.currentUser;
    print("User $user");
    if (user != null) {
      return getUser(CreateUserReq(email: user.email!, uid: user.uid));
    }
  }
}
