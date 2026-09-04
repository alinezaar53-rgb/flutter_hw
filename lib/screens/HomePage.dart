import 'package:flutter/material.dart';
import 'package:flutter_hw/themes/AppColor.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        children: const[
          Text("Hello Word"),
          Text("Hello Ali"),
          ElevatedButton(onPressed: null, child: Text("Click Me "),
          ),
        ],
      ),
    );

  }
}