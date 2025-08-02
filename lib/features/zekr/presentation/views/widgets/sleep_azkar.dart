import '../../../../../core/custom/custom_app_bar.dart';
import '../../../data/azkar_model/azkar_model.dart';
import 'package:flutter/material.dart';

class SleepAzkar extends StatelessWidget {
  const SleepAzkar({super.key, required this.azkarModel});
  final AzkarModel azkarModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          context: context, text1: 'أذكار النوم', centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              azkarModel.sleepAzkar![index].text!,
              textDirection: TextDirection.rtl,
              style:
                  TextStyle(fontSize: 15, color: Theme.of(context).canvasColor),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '( ${azkarModel.sleepAzkar![index].count} )',
                  style: const TextStyle(color: Colors.blue),
                ),
                const SizedBox(width: 5),
                const Text(
                  ':عدد مرات التكرار',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
              ],
            )
          ],
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: azkarModel.sleepAzkar!.length,
      ),
    );
  }
}
