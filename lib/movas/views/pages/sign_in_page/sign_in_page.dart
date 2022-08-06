import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/pages/sign_in_page/sign_in_body.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInBody(),
    );
  }
}
