import 'package:equatable/equatable.dart';

class MosqueAzkar extends Equatable {
  final int? id;
  final String? text;
  final int? count;

  const MosqueAzkar({this.id, this.text, this.count});

  factory MosqueAzkar.fromJson(Map<String, dynamic> json) => MosqueAzkar(
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
