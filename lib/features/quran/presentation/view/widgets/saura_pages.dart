import 'package:azkar/core/utiles/components.dart';
import 'package:azkar/features/quran/presentation/view/quran.dart';
import 'package:flutter/material.dart';

class SauraPages extends StatelessWidget {
  const SauraPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            pageNum = saura[saura.keys.toList()[index]];
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Quran()),
              (route) => false,
            );
          },
          child: Text(
            saura.keys.toList()[index],
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: saura.length,
      ),
    );
  }
}
