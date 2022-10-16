import 'dart:convert';

import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final String title;
  final String content;
  final dynamic createdAt;
  const Note({
    required this.title,
    required this.content,
    required this.createdAt,
  });

  Note copyWith({
    String? title,
    String? content,
    dynamic createdAt,
  }) {
    return Note(
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'content': content,
      'createdAt': createdAt,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] as String,
      content: map['content'] as String,
      createdAt: map['createdAt'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [title, content, createdAt];
}
