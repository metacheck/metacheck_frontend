import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/login_request.dart';
import 'package:metacheck_frontend/movas/views/widgets/buttons/outlined_button.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:metacheck_frontend/movas/views/widgets/textfiels/generic_form_field.dart';
import 'package:metacheck_frontend/utils/loading_action.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../actions/auth_action.dart';
import '../../../router.dart';
import '../../../ui/ui_consts.dart';
import '../../widgets/padded.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({Key? key}) : super(key: key);

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TopNavBarWeb(),
        Expanded(
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              initialValue: {
                ...LoginRequest(
                        username: "leo.radocaj2@gmail.com",
                        password: "LeoLeo123")
                    .toMap()
              },
              child: Center(
                child: Column(
                  children: [
                    MCTextFormField(
                      title: "Username",
                      name: "username",
                      hint: "Enter your username",
                      validator: FormBuilderValidators.required(),
                    ),
                    UI.sizes.spacing.md.v,
                    MCTextFormField(
                      obscure: true,
                      title: "Password",
                      name: "password",
                      hint: "Enter your password",
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.min(8),
                      ]),
                    ),
                    UI.sizes.spacing.xxl.v,
                    Padded(
                      child: ConstrainedContent(
                        child: MetacheckOutlinedButton(
                          text: "Log In",
                          onTap: () async {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              await loadingActionHandler(
                                  context,
                                  AuthAction.of(context).login(
                                      LoginRequest.fromMap(
                                          _formKey.currentState!.value)));
                              QR.to(AppRoutes.homePage);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
