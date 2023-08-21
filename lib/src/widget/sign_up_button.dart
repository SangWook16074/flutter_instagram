import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const SignUpButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
              color: const Color(0xff4287f5),
            )),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xff4287f5),
          ),
        ),
      ),
    );
  }
}
