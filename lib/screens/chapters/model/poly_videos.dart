// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'poly_videos.g.dart';

@JsonSerializable(createToJson: true)
class PolynomialVideos {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;

  PolynomialVideos(
      {this.data, this.status, this.statusCode, this.message, this.errorCode});

  factory PolynomialVideos.fromJson(Map<String, dynamic> Json) =>
      _$PolynomialVideosFromJson(Json);
  Map<String, dynamic> toJson() => _$PolynomialVideosToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  List<String>? tabs;
  List<Videos>? videos;
  bool? isKlassSubscribed;
  bool? isModuleSubscribed;
  Subject? subject;
  Chapter? chapter;

  Data(
      {this.tabs,
      this.videos,
      this.isKlassSubscribed,
      this.isModuleSubscribed,
      this.subject,
      this.chapter});

  factory Data.fromJson(Map<String, dynamic> Json) => _$DataFromJson(Json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class Videos {
  int? id;
  String? title;
  String? createdOn;
  String? uniqueKey;
  int? durationS;
  String? duration;
  String? durationMin;
  Thumbnails? thumbnails;
  bool? isDownloadable;
  String? lockType;
  bool? isLocked;
  bool? isBookmarked;

  Videos(
      {this.id,
      this.title,
      this.createdOn,
      this.uniqueKey,
      this.durationS,
      this.duration,
      this.durationMin,
      this.thumbnails,
      this.isDownloadable,
      this.lockType,
      this.isLocked,
      this.isBookmarked});

  factory Videos.fromJson(Map<String, dynamic> Json) => _$VideosFromJson(Json);
  Map<String, dynamic> toJson() => _$VideosToJson(this);
}

@JsonSerializable(createToJson: true)
class Thumbnails {
  String? s120;
  String? s240;
  String? s360;
  String? s640;
  int? id;

  Thumbnails({this.s120, this.s240, this.s360, this.s640, this.id});

  factory Thumbnails.fromJson(Map<String, dynamic> Json) =>
      _$ThumbnailsFromJson(Json);
  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}

@JsonSerializable(createToJson: true)
class Subject {
  int? id;
  String? name;
  String? slug;

  Subject({this.id, this.name, this.slug});

  factory Subject.fromJson(Map<String, dynamic> Json) =>
      _$SubjectFromJson(Json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable(createToJson: true)
class Chapter {
  int? id;
  String? name;
  String? slug;
  List<CheatsheetUrls>? cheatsheetUrls;

  Chapter({this.id, this.name, this.slug, this.cheatsheetUrls});

  factory Chapter.fromJson(Map<String, dynamic> Json) =>
      _$ChapterFromJson(Json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

@JsonSerializable(createToJson: true)
class CheatsheetUrls {
  String? url;

  CheatsheetUrls({this.url});

  factory CheatsheetUrls.fromJson(Map<String, dynamic> Json) =>
      _$CheatsheetUrlsFromJson(Json);
  Map<String, dynamic> toJson() => _$CheatsheetUrlsToJson(this);
}
