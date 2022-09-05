enum UserState {
  loggedIn,
  loggedOut,
}

class UserO {
  final UserState userState;
  final String? name;
  final String? email;
  final String? uid;

  const UserO({
    this.name,
    this.email,
    this.uid,
    this.userState = UserState.loggedOut,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserO &&
          runtimeType == other.runtimeType &&
          userState == other.userState &&
          name == other.name &&
          email == other.email &&
          uid == other.uid;

  @override
  int get hashCode =>
      userState.hashCode ^ name.hashCode ^ email.hashCode ^ uid.hashCode;
}
