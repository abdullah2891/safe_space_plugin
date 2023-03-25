import 'package:flutter/material.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;
  final bool isEnabled;
  final EdgeInsetsGeometry? padding;

  const WidgetWrapper(
      {super.key, required this.child, required this.isEnabled, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(0),
      child: AbsorbPointer(
        absorbing: !isEnabled,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          foregroundDecoration: isEnabled
              ? null
              : const BoxDecoration(
                  color: Colors.grey,
                  backgroundBlendMode: BlendMode.saturation,
                ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
