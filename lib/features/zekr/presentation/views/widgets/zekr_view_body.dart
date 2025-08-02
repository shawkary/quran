import '../../../../../core/custom/custom_button.dart';
import '../../../../../core/utiles/functions.dart';
import '../../../../../core/utiles/map_azkar.dart';
import '../../../data/azkar_model/azkar_model.dart';
import 'after_prayer_azkar.dart';
import 'counter.dart';
import 'different_azkar.dart';
import 'evening_azkar.dart';
import 'morning_azkar.dart';
import 'sleep_azkar.dart';
import 'package:flutter/material.dart';

class ZekrViewBody extends StatefulWidget {
  const ZekrViewBody({super.key});

  @override
  State<ZekrViewBody> createState() => _ZekrViewBodyState();
}

class _ZekrViewBodyState extends State<ZekrViewBody> {
  late AzkarModel azkarModel;
  @override
  void initState() {
    azkarModel = AzkarModel.fromJson(mapAzkar);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 35.0, horizontal: MediaQuery.sizeOf(context).width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CustomButton(
                  onPressed: () =>
                      navigateTo(context, MorningAzkar(azkarModel: azkarModel)),
                  text: 'أذكار الصباح',
                ),
                CustomButton(
                    onPressed: () => navigateTo(
                        context, EveningAzkar(azkarModel: azkarModel)),
                    text: 'أذكار المساء'),
              ],
            ),
            Row(
              children: [
                CustomButton(
                    onPressed: () => navigateTo(
                        context,
                        AzkarAfterPrayer(
                          azkarModel: azkarModel,
                        )),
                    text: 'أذكار بعد الصلاة'),
                CustomButton(
                    onPressed: () =>
                        navigateTo(context, SleepAzkar(azkarModel: azkarModel)),
                    text: 'أذكار النوم'),
              ],
            ),
            CustomButton(
                onPressed: () =>
                    navigateTo(context, DifferentAzkar(azkarModel: azkarModel)),
                text: 'أذكار متنوعة'),
            CustomButton(
                onPressed: () => navigateTo(context, const Counter()),
                backgroundColor: Colors.redAccent.shade200,
                text: 'عداد الذكر'),
          ],
        ),
      ),
    );
  }
}
