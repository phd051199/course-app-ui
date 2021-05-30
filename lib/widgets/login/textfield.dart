import 'package:course_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key key,
    this.label,
    this.isPwdField,
    this.onChanged,
    this.isInvalid,
    this.inputController,
    this.errorText,
  }) : super(key: key);
  final label, isPwdField, isInvalid, inputController, errorText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    bool showPass = false;
    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: TextField(
            controller: inputController,
            onChanged: onChanged,
            obscureText: isPwdField == true ? !showPass : false,
            decoration: InputDecoration(
              labelText: label,
              errorText: errorText,
              labelStyle: GoogleFonts.getFont(
                'Montserrat',
                color: primaryTextColor,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: primaryTextColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isInvalid ? Colors.red : Colors.green,
                ),
              ),
            ),
            style: GoogleFonts.getFont(
              'Montserrat',
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            cursorColor: primaryTextColor,
          ),
        ),
        isInvalid
            ? Icon(
                Icons.close,
                color: Colors.red,
              )
            : Icon(
                Icons.check,
                color: Colors.green,
              ),
      ],
    );
  }
}
