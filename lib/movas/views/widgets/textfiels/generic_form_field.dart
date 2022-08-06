import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:metacheck_frontend/movas/ui/ui_consts.dart';
import 'package:metacheck_frontend/movas/views/widgets/padded.dart';

class MCTextFormField extends StatelessWidget {
  final String name;
  final FormFieldValidator<String>? validator;
  final String? hint;
  final String? label;
  final String title;
  final bool obscure;
  MCTextFormField({
    required this.name,
    required this.hint,
    required this.title,
    this.obscure = false,
    this.validator,
    this.label,
  }) : super(key: ValueKey(name));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).inputDecorationTheme;

    return Padded(
      child: ConstrainedContent(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.labelStyle,
            ),
            SizedBox(
              height: UI.sizes.spacing.xxs,
            ),
            FormBuilderTextField(
              obscureText: obscure,
              style: Theme.of(context).textTheme.bodyText1,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                label: label == null ? null : Text(label!),
                errorStyle: theme.errorStyle,
                errorMaxLines: 3,
              ).applyDefaults(theme),
              name: name,
            ),
          ],
        ),
      ),
    );
  }
}
