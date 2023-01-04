// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MathsChapterList _$MathsChapterListFromJson(Map<String, dynamic> json) =>
    MathsChapterList(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$MathsChapterListToJson(MathsChapterList instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => Chapters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'subject': instance.subject,
      'chapters': instance.chapters,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      name: json['name'] as String?,
      id: json['id'] as int?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'slug': instance.slug,
    };

Chapters _$ChaptersFromJson(Map<String, dynamic> json) => Chapters(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      id: json['id'] as int?,
      nVideos: json['nVideos'] as int?,
      nStories: json['nStories'] as int?,
      nConcepts: json['nConcepts'] as int?,
      nExercise: json['nExercise'] as int?,
      sequenceNo: json['sequenceNo'] as int?,
    );

Map<String, dynamic> _$ChaptersToJson(Chapters instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'id': instance.id,
      'nVideos': instance.nVideos,
      'nStories': instance.nStories,
      'nConcepts': instance.nConcepts,
      'nExercise': instance.nExercise,
      'sequenceNo': instance.sequenceNo,
    };
