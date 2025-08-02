import 'package:equatable/equatable.dart';

class PrayerLaterAzkar extends Equatable {
  final int? id;
  final String? text;
  final int? count;

  const PrayerLaterAzkar({this.id, this.text, this.count});

  factory PrayerLaterAzkar.fromJson(Map<String, dynamic> json) {
    return PrayerLaterAzkar(
      id: json['id'] as int?,
      text: json['text'] as String?,
      count: json['count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'count': count,
      };

  @override
  List<Object?> get props => [id, text, count];
}
