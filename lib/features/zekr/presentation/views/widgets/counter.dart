import '../../../../../core/utiles/shared_pref.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = SharedPref.getInt('counter') ?? 0;
  late LongPressGestureRecognizer _longPressGesture;

  @override
  void initState() {
    super.initState();
    showSnackBar();
    _longPressGesture = LongPressGestureRecognizer(
      duration: const Duration(seconds: 2),
    )..onLongPress = () => setState(() {
          counter = 0;
          SharedPref.saveInt('counter', counter);
        });
  }

  void showSnackBar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('اضغط مطولاً لتصفير العداد',
              textDirection: TextDirection.rtl),
          duration: Duration(seconds: 2),
        ),
      );
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
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Center(
              child: Text(
                '$counter',
                style: TextStyle(
                    fontSize: 30, color: Theme.of(context).canvasColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
