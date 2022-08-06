import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:metacheck_frontend/movas/actions/auth_action.dart';
import 'package:metacheck_frontend/movas/router.dart';
import 'package:metacheck_frontend/movas/services/auth/requests/register_request.dart';
import 'package:metacheck_frontend/movas/views/widgets/buttons/outlined_button.dart';
import 'package:metacheck_frontend/movas/views/widgets/navigation/top_nav_web.dart';
import 'package:metacheck_frontend/movas/views/widgets/textfiels/generic_form_field.dart';
import 'package:metacheck_frontend/utils/loading_action.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../../../ui/ui_consts.dart';
import '../../widgets/padded.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TopNavBarWeb(),
        Expanded(
          child: SingleChildScrollView(
            child: FormBuilder(
              initialValue: {
                ...const RegisterRequest(
                        email: "leo.radocaj2@gmail.com", password: "LeoLeo123")
                    .toMap()
              },
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    MCTextFormField(
                      title: "Email",
                      name: "email",
                      hint: "Enter your email",
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
                          text: "Register",
                          onTap: () async {
                            if (_formKey.currentState?.saveAndValidate() ??
                                false) {
                              await loadingActionHandler(
                                  context,
                                  AuthAction.of(context).register(
                                      RegisterRequest.fromMap(
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
