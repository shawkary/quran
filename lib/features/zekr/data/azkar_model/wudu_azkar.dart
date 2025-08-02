import 'package:equatable/equatable.dart';

class WuduAzkar extends Equatable {
  final int? id;
  final String? text;
  final int? count;

  const WuduAzkar({this.id, this.text, this.count});

  factory WuduAzkar.fromJson(Map<String, dynamic> json) => WuduAzkar(
        id: json['id'] as int?,
        text: json['text'] as String?,
        count: json['count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'count': count,
      };

  @override
  List<Object?> get props => [id, text, count];
}
