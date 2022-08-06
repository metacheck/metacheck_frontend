import 'package:cloud_firestore/cloud_firestore.dart';

class UserE {
  final String name;
  final String email;
  final String uid;
  UserE({required this.name, required this.uid, required this.email});

  factory UserE.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserE(
        uid: doc.id,
        name: doc.data()!["name"] ?? "",
        email: doc.data()!["email"]);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
    };
  }
}
