import 'package:flutter/material.dart';
import 'package:flutter_pixabay_image_search_app/presentation/component/skeleton_effect.dart';

class SkeletonImage extends StatefulWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;

  const SkeletonImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0,
  });

  @override
  State<SkeletonImage> createState() => _SkeletonImageState();
}

class _SkeletonImageState extends State<SkeletonImage> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!_isLoaded)
          SkeletonEffect(
            width: widget.width,
            height: widget.height,
            borderRadius: widget.borderRadius,
          ),
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: Image.network(
            widget.imageUrl,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                Future.microtask(() {
                  if (!_isLoaded) {
                    setState(() {
                      _isLoaded = true;
                    });
                  }
                });
                return child;
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ],
    );
  }
}
