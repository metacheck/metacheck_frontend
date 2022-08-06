import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/pages/sign_up_page/sign_up_body.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
