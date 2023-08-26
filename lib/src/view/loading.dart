import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            strokeWidth: 2.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
