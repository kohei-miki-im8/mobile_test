import 'package:econa_mobile_app/presentations/components/feature_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FeaturesList extends HookConsumerWidget {
  const FeaturesList({
    required this.features,
    super.key,
  });

  final List<FeatureData> features;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 8,
      children: features
          .map(
            (f) => FeatureCard(
              icon: f.icon,
              title: f.title,
              description: f.body,
              cost: f.cost,
              unit: f.unit,
            ),
          )
          .toList(),
    );
  }
}
