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
}
