// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poly_videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolynomialVideos _$PolynomialVideosFromJson(Map<String, dynamic> json) =>
    PolynomialVideos(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$PolynomialVideosToJson(PolynomialVideos instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      tabs: (json['tabs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
      isKlassSubscribed: json['isKlassSubscribed'] as bool?,
      isModuleSubscribed: json['isModuleSubscribed'] as bool?,
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'tabs': instance.tabs,
      'videos': instance.videos,
      'isKlassSubscribed': instance.isKlassSubscribed,
      'isModuleSubscribed': instance.isModuleSubscribed,
      'subject': instance.subject,
      'chapter': instance.chapter,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      id: json['id'] as int?,
      title: json['title'] as String?,
      createdOn: json['createdOn'] as String?,
      uniqueKey: json['uniqueKey'] as String?,
      durationS: json['durationS'] as int?,
      duration: json['duration'] as String?,
      durationMin: json['durationMin'] as String?,
      thumbnails: json['thumbnails'] == null
          ? null
          : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      isDownloadable: json['isDownloadable'] as bool?,
      lockType: json['lockType'] as String?,
      isLocked: json['isLocked'] as bool?,
      isBookmarked: json['isBookmarked'] as bool?,
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdOn': instance.createdOn,
      'uniqueKey': instance.uniqueKey,
      'durationS': instance.durationS,
      'duration': instance.duration,
      'durationMin': instance.durationMin,
      'thumbnails': instance.thumbnails,
      'isDownloadable': instance.isDownloadable,
      'lockType': instance.lockType,
      'isLocked': instance.isLocked,
      'isBookmarked': instance.isBookmarked,
    };

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails(
      s120: json['s120'] as String?,
      s240: json['s240'] as String?,
      s360: json['s360'] as String?,
      s640: json['s640'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      's120': instance.s120,
      's240': instance.s240,
      's360': instance.s360,
      's640': instance.s640,
      'id': instance.id,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      cheatsheetUrls: (json['cheatsheetUrls'] as List<dynamic>?)
          ?.map((e) => CheatsheetUrls.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'cheatsheetUrls': instance.cheatsheetUrls,
    };

CheatsheetUrls _$CheatsheetUrlsFromJson(Map<String, dynamic> json) =>
    CheatsheetUrls(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$CheatsheetUrlsToJson(CheatsheetUrls instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
