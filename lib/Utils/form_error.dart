import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({Key? key, required this.errors}) : super(key: key);
  final List<String> errors;
  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        List.generate(
          errors.length,
          (index) => formErrorTest(
            error: errors[index],
          ),
        ),
    );
  }
  Row formErrorTest({required String error}){
    return Row(
      children: [
        Icon(Icons.warning, color: Colors.black),
        SizedBox(width: 10),
        Text(error, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          color: Colors.red,
          //decoration: TextDecoration.underline,
        ))
      ],
    );
}
}
