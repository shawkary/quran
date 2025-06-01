import 'package:azkar/core/utiles/shared_pref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Azkar extends StatefulWidget {
  const Azkar({super.key});

  @override
  State<Azkar> createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {
  int counter = SharedPref.getInt('counter') ?? 0;
  late LongPressGestureRecognizer _longPressGesture;

  @override
  void initState() {
    super.initState();
    _longPressGesture = LongPressGestureRecognizer(
      duration: const Duration(seconds: 2),
    )..onLongPress = () => setState(() {
          counter = 0;
          SharedPref.saveInt('counter', counter);
        });
  }

  @override
  void dispose() {
    _longPressGesture.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RawGestureDetector(
        gestures: {
          LongPressGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<LongPressGestureRecognizer>(
            () => _longPressGesture,
            (LongPressGestureRecognizer instance) {},
          ),
        },
        child: GestureDetector(
          onTap: () {
            setState(() {
              counter++;
            });
            SharedPref.saveInt('counter', counter);
          },
          child: Container(
            color: Colors.black,
            child: Center(
              child: Text(
                '$counter',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
