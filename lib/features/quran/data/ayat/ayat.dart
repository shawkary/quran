import 'package:equatable/equatable.dart';

class Ayat extends Equatable {
  final String? id;
  final String? number;
  final String? text;
  final String? numberInSurah;
  final String? page;
  final String? surahId;
  final String? hizbId;
  final String? juzId;
  final String? sajda;

  const Ayat({
    this.id,
    this.number,
    this.text,
    this.numberInSurah,
    this.page,
    this.surahId,
    this.hizbId,
    this.juzId,
    this.sajda,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) => Ayat(
        id: json['id'] as String?,
        number: json['number'] as String?,
        text: json['text'] as String?,
        numberInSurah: json['number_in_surah'] as String?,
        page: json['page'] as String?,
        surahId: json['surah_id'] as String?,
        hizbId: json['hizb_id'] as String?,
        juzId: json['juz_id'] as String?,
        sajda: json['sajda'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'number': number,
        'text': text,
        'number_in_surah': numberInSurah,
        'page': page,
        'surah_id': surahId,
        'hizb_id': hizbId,
        'juz_id': juzId,
        'sajda': sajda,
      };

  @override
  List<Object?> get props {
    return [
      id,
      number,
      text,
      numberInSurah,
      page,
      surahId,
      hizbId,
      juzId,
      sajda,
    ];
  }
}
