import '../../../../../core/utiles/components.dart';
import 'package:flutter/material.dart';

void showOverlay(BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.8),
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('$gozNum',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 5),
                    const Text('الجزء',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: [
                    Text('${(gozNum * 2) - 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(width: 5),
                    const Text('الحزب',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 1), () {
    overlayEntry.remove();
  });
}
