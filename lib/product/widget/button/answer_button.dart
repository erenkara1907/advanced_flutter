import 'dart:math';

import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  const AnswerButton({Key? key, this.onNumber}) : super(key: key);
  final bool Function(int number)? onNumber;
  @override
// ignore: library_private_types_in_public_api
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  // Bana sayi don random olarak bu sayı kontrol edip sana cevap vericem
  // Bu cevaba gore butonun rengini güncelle
  // Eğer doğru ise yeşil yanlış ise kırmızı yap

  Color? _backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: _backgroundColor),
      onPressed: () {
        final result = Random().nextInt(10);
        final response = widget.onNumber?.call(result) ?? false;
        setState(() {
          _backgroundColor = response ? Colors.green : Colors.red;
        });
      },
      child: const Text('data'),
    );
  }
}
