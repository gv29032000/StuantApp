// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'chapter_list.g.dart';

@JsonSerializable(createToJson: true)
class MathsChapterList {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;

  MathsChapterList(
      {this.data, this.status, this.statusCode, this.message, this.errorCode});
  factory MathsChapterList.fromJson(Map<String, dynamic> Json) =>
      _$MathsChapterListFromJson(Json);
  Map<String, dynamic> toJson() => _$MathsChapterListToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  Subject? subject;
  List<Chapters>? chapters;

  Data({this.subject, this.chapters});
  factory Data.fromJson(Map<String, dynamic> Json) => _$DataFromJson(Json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class Subject {
  String? name;
  int? id;
  String? slug;

  Subject({this.name, this.id, this.slug});
  factory Subject.fromJson(Map<String, dynamic> Json) =>
      _$SubjectFromJson(Json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable(createToJson: true)
class Chapters {
  String? name;
  String? slug;
  int? id;
  int? nVideos;
  int? nStories;
  int? nConcepts;
  int? nExercise;
  int? sequenceNo;

  Chapters(
      {this.name,
      this.slug,
      this.id,
      this.nVideos,
      this.nStories,
      this.nConcepts,
      this.nExercise,
      this.sequenceNo});
  factory Chapters.fromJson(Map<String, dynamic> Json) =>
      _$ChaptersFromJson(Json);
  Map<String, dynamic> toJson() => _$ChaptersToJson(this);
}
