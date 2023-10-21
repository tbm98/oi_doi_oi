import 'package:flutter/material.dart';

import 'decorated_outlined_border.dart';
import 'gradient_shadow.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    required this.gradient,
    required this.onTap,
    required this.child,
    this.shadowRadius = 0,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.minHeight = 44,
    super.key,
  });
  final Gradient gradient;
  final VoidCallback? onTap;
  final double shadowRadius;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry? padding;
  final double minHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.zero),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            return DecoratedOutlinedBorder(
              shadow: shadowRadius <= 0
                  ? const []
                  : [
                      GradientShadow(
                        gradient: gradient,
                        blurRadius: shadowRadius,
                      )
                    ],
              child: RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: BorderSide.none,
              ),
            );
          },
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          padding: padding,
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
