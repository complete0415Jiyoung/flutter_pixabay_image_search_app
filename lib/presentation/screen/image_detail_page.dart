import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  final int id;
  const ImageDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('datail page $id')));
  }
}
