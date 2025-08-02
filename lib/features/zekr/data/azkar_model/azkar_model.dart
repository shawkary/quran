import 'package:equatable/equatable.dart';

import 'adhan_azkar.dart';
import 'evening_azkar.dart';
import 'food_azkar.dart';
import 'hajj_and_umrah_azkar.dart';
import 'home_azkar.dart';
import 'khala_azkar.dart';
import 'miscellaneous_azkar.dart';
import 'morning_azkar.dart';
import 'mosque_azkar.dart';
import 'prayer_azkar.dart';
import 'prayer_later_azkar.dart';
import 'sleep_azkar.dart';
import 'wake_up_azkar.dart';
import 'wudu_azkar.dart';

class AzkarModel extends Equatable {
  final List<MorningAzkar>? morningAzkar;
  final List<EveningAzkar>? eveningAzkar;
  final List<PrayerAzkar>? prayerAzkar;
  final List<PrayerLaterAzkar>? prayerLaterAzkar;
  final List<SleepAzkar>? sleepAzkar;
  final List<WakeUpAzkar>? wakeUpAzkar;
  final List<MosqueAzkar>? mosqueAzkar;
  final List<MiscellaneousAzkar>? miscellaneousAzkar;
  final List<AdhanAzkar>? adhanAzkar;
  final List<WuduAzkar>? wuduAzkar;
  final List<HomeAzkar>? homeAzkar;
  final List<KhalaAzkar>? khalaAzkar;
  final List<FoodAzkar>? foodAzkar;
  final List<HajjAndUmrahAzkar>? hajjAndUmrahAzkar;

  const AzkarModel({
    this.morningAzkar,
    this.eveningAzkar,
    this.prayerAzkar,
    this.prayerLaterAzkar,
    this.sleepAzkar,
    this.wakeUpAzkar,
    this.mosqueAzkar,
    this.miscellaneousAzkar,
    this.adhanAzkar,
    this.wuduAzkar,
    this.homeAzkar,
    this.khalaAzkar,
    this.foodAzkar,
    this.hajjAndUmrahAzkar,
  });

  factory AzkarModel.fromJson(Map<String, dynamic> json) => AzkarModel(
        morningAzkar: (json['morning_azkar'] as List<dynamic>?)
            ?.map((e) => MorningAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        eveningAzkar: (json['evening_azkar'] as List<dynamic>?)
            ?.map((e) => EveningAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        prayerAzkar: (json['prayer_azkar'] as List<dynamic>?)
            ?.map((e) => PrayerAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        prayerLaterAzkar: (json['prayer_later_azkar'] as List<dynamic>?)
            ?.map((e) => PrayerLaterAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        sleepAzkar: (json['sleep_azkar'] as List<dynamic>?)
            ?.map((e) => SleepAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        wakeUpAzkar: (json['wake_up_azkar'] as List<dynamic>?)
            ?.map((e) => WakeUpAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        mosqueAzkar: (json['mosque_azkar'] as List<dynamic>?)
            ?.map((e) => MosqueAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        miscellaneousAzkar: (json['miscellaneous_azkar'] as List<dynamic>?)
            ?.map((e) => MiscellaneousAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        adhanAzkar: (json['adhan_azkar'] as List<dynamic>?)
            ?.map((e) => AdhanAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        wuduAzkar: (json['wudu_azkar'] as List<dynamic>?)
            ?.map((e) => WuduAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        homeAzkar: (json['home_azkar'] as List<dynamic>?)
            ?.map((e) => HomeAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        khalaAzkar: (json['khala_azkar'] as List<dynamic>?)
            ?.map((e) => KhalaAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        foodAzkar: (json['food_azkar'] as List<dynamic>?)
            ?.map((e) => FoodAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
        hajjAndUmrahAzkar: (json['hajj_and_umrah_azkar'] as List<dynamic>?)
            ?.map((e) => HajjAndUmrahAzkar.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'morning_azkar': morningAzkar?.map((e) => e.toJson()).toList(),
        'evening_azkar': eveningAzkar?.map((e) => e.toJson()).toList(),
        'prayer_azkar': prayerAzkar?.map((e) => e.toJson()).toList(),
        'prayer_later_azkar': prayerLaterAzkar?.map((e) => e.toJson()).toList(),
        'sleep_azkar': sleepAzkar?.map((e) => e.toJson()).toList(),
        'wake_up_azkar': wakeUpAzkar?.map((e) => e.toJson()).toList(),
        'mosque_azkar': mosqueAzkar?.map((e) => e.toJson()).toList(),
        'miscellaneous_azkar':
            miscellaneousAzkar?.map((e) => e.toJson()).toList(),
        'adhan_azkar': adhanAzkar?.map((e) => e.toJson()).toList(),
        'wudu_azkar': wuduAzkar?.map((e) => e.toJson()).toList(),
        'home_azkar': homeAzkar?.map((e) => e.toJson()).toList(),
        'khala_azkar': khalaAzkar?.map((e) => e.toJson()).toList(),
        'food_azkar': foodAzkar?.map((e) => e.toJson()).toList(),
        'hajj_and_umrah_azkar':
            hajjAndUmrahAzkar?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      morningAzkar,
      eveningAzkar,
      prayerAzkar,
      prayerLaterAzkar,
      sleepAzkar,
      wakeUpAzkar,
      mosqueAzkar,
      miscellaneousAzkar,
      adhanAzkar,
      wuduAzkar,
      homeAzkar,
      khalaAzkar,
      foodAzkar,
      hajjAndUmrahAzkar,
    ];
  }
}
