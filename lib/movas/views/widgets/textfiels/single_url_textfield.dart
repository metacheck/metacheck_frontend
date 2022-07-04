import 'package:flutter/material.dart';
import 'package:metacheck_frontend/movas/views/theme/theme.dart';

class SingleUrlTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final VoidCallback onTap;
  const SingleUrlTextField({
    required this.textEditingController,
    required this.hintText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: OATheme.of(context).primaryColor, width: 3),
    );
    return Container(
      constraints: BoxConstraints(maxWidth: 444),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        cursorColor: Colors.grey,
        style: OATheme.of(context).baseTextStyle.copyWith(fontSize: 18),
        controller: textEditingController,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            suffixIcon: InkWell(
              onTap: onTap,
              child: Container(
                  height: 60,
                  width: 50,
                  color: OATheme.of(context).primaryColor,
                  child: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.white,
                  )),
            ),
            border: border,
            disabledBorder: border,
            enabledBorder: border,
            errorBorder: border,
            focusedBorder: border,
            focusedErrorBorder: border),
      ),
    );
  }
}
