import 'package:flutter/material.dart';
import 'package:flutter_instagram/src/widget/image_data.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              '_ugsxng99',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            ImageData(
              path: ImagePath.arrowDownIcon,
              width: 60,
            )
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ImageData(path: ImagePath.upload),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ImageData(path: ImagePath.menuIcon),
          ),
        ],
      ),
    );
  }
}
