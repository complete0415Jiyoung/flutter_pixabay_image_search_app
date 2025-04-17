import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ImageListPage extends StatefulWidget {
  const ImageListPage({super.key});

  @override
  State<ImageListPage> createState() => _ImageListPageState();
}

class _ImageListPageState extends State<ImageListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.pushNamed('imageDetail', pathParameters: {'id': '1'});
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: const Center(child: Text('Image List Page')),
          ),
        ),
      ),
    );
  }
}
