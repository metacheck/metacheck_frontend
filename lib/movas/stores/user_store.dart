import 'package:metacheck_frontend/movas/models/user/user.dart';
import 'package:metacheck_frontend/movas/observables/user_observable.dart';
import 'package:movas/movas.dart';
import 'package:movas/provider/provider.dart';

class UserStore extends Store<UserO> {
  final PublishSubject<UserE?> user$;

  UserStore(this.user$) {
    user$.listen((value) {
      if (value == null) {
        add(UserO());
      } else {
        add(UserO(
            name: value.name,
            email: value.email,
            uid: value.uid,
            userState: UserState.loggedIn));
      }
    });
  }
}
