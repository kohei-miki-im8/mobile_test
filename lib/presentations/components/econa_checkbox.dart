import 'dart:math' as math;
import 'package:econa_mobile_app/presentations/color.dart';
import 'package:econa_mobile_app/presentations/gen/assets.gen.dart';
import 'package:econa_mobile_app/presentations/style.dart';
import 'package:flutter/material.dart';

class EconaCheckbox extends StatelessWidget {
  const EconaCheckbox({
    required this.value,
    required this.onChanged,
    this.borderRadius,
    this.height = 18,
    this.width = 18,
    this.text = '',
    this.textStyle,
    this.readOnly = false,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final BorderRadius? borderRadius;
  final double height;
  final double width;
  final String text;
  final TextStyle? textStyle;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final TextStyle defaultTextStyle = EconaTextStyle.labelSmall140(color: EconaColor.grayNormal);

    final double boxH = height;
    final double boxW = width;
    final double paddingAll = 3;
    final double checkSize = math.max(0, math.min(boxH, boxW) - paddingAll * 2);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: readOnly ? null : () { onChanged(!value); },
        borderRadius: borderRadius ?? BorderRadius.circular(6),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 44, minWidth: 44),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: boxH,
                  width: boxW,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius ?? BorderRadius.circular(6),
                    gradient: value
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFD097DB), Color(0xFF8887EE)],
                          )
                        : null,
                    color: value ? null : Colors.white,
                    border: value
                        ? null
                        : Border.all(
                            color: EconaColor.grayNormal.withValues(alpha: 0.6),
                            width: 1,
                          ),
                  ),
                  child: value
                      ? Padding(
                          padding: EdgeInsets.all(paddingAll),
                          child: Assets.images.icons.whiteCheck.svg(
                            height: checkSize,
                            width: checkSize,
                          ),
                        )
                      : null,
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    text,
                    style: textStyle ?? defaultTextStyle,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}