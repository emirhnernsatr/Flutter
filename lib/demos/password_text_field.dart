// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obsecureText = '#';
  
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofillHints: [AutofillHints.password],
      keyboardType: TextInputType.visiblePassword,
      obscureText: _isSecure,
      obscuringCharacter: _obsecureText,
      decoration: InputDecoration(
        border: UnderlineInputBorder(), 
        hintText: 'Password',
        suffix: _onVisiblityIcon(),
        ),
    );
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: () {
        _changeLoading();
      },
        icon: AnimatedCrossFade(
        firstChild: Icon(Icons.visibility_outlined), 
        secondChild: Icon(Icons.visibility_off_outlined), 
        crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond, 
        duration: Duration(seconds: 2)
        )
    );
      //icon: Icon(_isSecure ? Icons.visibility : Icons.visibility_off));
  }
}