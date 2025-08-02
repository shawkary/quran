import 'package:flutter/material.dart';

class ContainerBottomEdge extends StatelessWidget {
  const ContainerBottomEdge({
    super.key,
    required this.child,
    this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
  });
  final Widget child;
  final double? width;
  final double height;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      height: height,
      color: Colors.black.withValues(alpha: 0.8),
      child: Center(child: FittedBox(fit: BoxFit.scaleDown, child: child)),
    );
  }
}

class PageContainer extends StatelessWidget {
  const PageContainer({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: .7),
          border: Border.all(color: Theme.of(context).canvasColor, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(color: color, thickness: 2),
          Divider(color: color, thickness: 2),
          Divider(color: color, thickness: 2),
          Divider(color: color, thickness: 2),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * .0075,
        height: MediaQuery.sizeOf(context).height * .11,
        color: Colors.grey);
  }
}
