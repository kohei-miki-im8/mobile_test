import 'package:econa_mobile_app/presentations/components/gradient_border_and_shadow_container.dart';
import 'package:flutter/material.dart';

class PhotoFrame extends StatelessWidget {
  const PhotoFrame({
    required this.imageUrl,
    required this.size,
    super.key,
  });

  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    const String fallbackAsset = 'assets/images/test/no_image_temp.webp';
    ImageProvider provider;
    if (imageUrl == null || imageUrl!.isEmpty) {
      provider = const AssetImage(fallbackAsset);
    } else if (imageUrl!.startsWith('http')) {
      provider = NetworkImage(imageUrl!);
    } else {
      provider = AssetImage(imageUrl!);
    }

    return ShadowAndGradientBorderContainer(
      borderRadius: BorderRadius.circular(100),
      borderWidth: 2,
      gradients: const [
        LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFFFFFFF),
          ],
        ),
      ],
      backgroundColor: const Color(0xFFFFFFFF),
      innerShadows: const [],
      dropShadows: [
        BoxShadow(
          offset: const Offset(2, 2),
          blurRadius: 4,
          color: const Color(0xFF7273AB).withValues(alpha: 0.1),
        ),
        const BoxShadow(
          offset: Offset(-6, -6),
          blurRadius: 20,
          color: Colors.white,
        ),
        BoxShadow(
          offset: const Offset(4, 4),
          blurRadius: 20,
          color: const Color(0xFF6F75B0).withValues(alpha: 0.24),
        ),
      ],
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: provider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}