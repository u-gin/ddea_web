import 'package:ddea_web/utils/constants.dart';
import 'package:flutter/material.dart';

class ViewRequestLayout extends StatefulWidget {
  const ViewRequestLayout({super.key});

  @override
  State<ViewRequestLayout> createState() => _ViewRequestLayoutState();
}

class _ViewRequestLayoutState extends State<ViewRequestLayout> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: canvasWidth,
      child: const Column(
        children: [
          Text(''),
        ],
      ),
    );
  }
}
