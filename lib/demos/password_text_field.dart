import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key, this.textEditingController})
      : super(key: key);
  final TextEditingController? textEditingController;
  @override
// ignore: library_private_types_in_public_api
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureText = '#';
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.textEditingController,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        obscuringCharacter: _obscureText,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: 'Password',
          suffix: _onVisiblityIcon(),
        ));
  }

  IconButton _onVisiblityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      icon: AnimatedCrossFade(
        firstChild: const Icon(Icons.visibility_outlined),
        secondChild: const Icon(Icons.visibility_off_outlined),
        crossFadeState:
            _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: _DurationUtility.durationLow,
      ),
    );
  }
}

class _DurationUtility extends Duration {
  static const Duration durationLow = Duration(seconds: 1);
}
