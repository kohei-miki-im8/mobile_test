import 'package:flutter/material.dart';

class BorderedPhotoComponent extends StatelessWidget {
  const BorderedPhotoComponent({
    required this.image,
    this.width = 93,
    this.height = 157,
    this.cornerRadius = 12,
    this.opacity = 1.0,
    this.fillColor = const Color(0xFFFFFFFF),
    this.fillOpacity = 1.0,
    this.strokeColor = const Color(0xFFFFFFFF),
    this.strokeOpacity = 1.0,
    this.strokeWidth = 1,
    this.clipContent = true,
    super.key,
  });

  final Widget? image;
  final double width;
  final double height;
  final double cornerRadius;
  final double opacity;
  final Color fillColor;
  final double fillOpacity;
  final Color strokeColor;
  final double strokeOpacity;
  final double strokeWidth;
  final bool clipContent;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: fillColor.withValues(alpha: fillOpacity),
          borderRadius: BorderRadius.circular(cornerRadius),
          border: Border.all(
            color: strokeColor.withValues(alpha: strokeOpacity),
            width: strokeWidth,
          ),
        ),
        child: clipContent
            ? ClipRRect(
                borderRadius: BorderRadius.circular(cornerRadius),
                child: _BorderedPhotoImage(
                  image: image,
                  width: width,
                  height: height,
                  cornerRadius: cornerRadius,
                  fillColor: fillColor,
                  fillOpacity: fillOpacity,
                ),
              )
            : _BorderedPhotoImage(
                image: image,
                width: width,
                height: height,
                cornerRadius: cornerRadius,
                fillColor: fillColor,
                fillOpacity: fillOpacity,
              ),
      ),
    );
  }
}

/// 画像表示専用のStatelessWidget
class _BorderedPhotoImage extends StatelessWidget {
  const _BorderedPhotoImage({
    required this.image,
    required this.width,
    required this.height,
    required this.cornerRadius,
    required this.fillColor,
    required this.fillOpacity,
  });

  final Widget? image;
  final double width;
  final double height;
  final double cornerRadius;
  final Color fillColor;
  final double fillOpacity;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return _EmptyStateContainer(
        width: width,
        height: height,
        cornerRadius: cornerRadius,
        fillColor: fillColor,
        fillOpacity: fillOpacity,
        icon: Icons.person,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: image,
    );
  }
}

/// 空状態表示用のStatelessWidget
class _EmptyStateContainer extends StatelessWidget {
  const _EmptyStateContainer({
    required this.width,
    required this.height,
    required this.cornerRadius,
    required this.fillColor,
    required this.fillOpacity,
    required this.icon,
  });

  final double width;
  final double height;
  final double cornerRadius;
  final Color fillColor;
  final double fillOpacity;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor.withValues(alpha: fillOpacity),
        borderRadius: BorderRadius.circular(cornerRadius),
      ),
      child: Center(
        child: Icon(
          icon,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
