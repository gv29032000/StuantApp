// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'poly_set2.g.dart';

@JsonSerializable(createToJson: true)
class PolynomialSet2 {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;

  PolynomialSet2(
      {this.data, this.status, this.statusCode, this.message, this.errorCode});
  factory PolynomialSet2.fromJson(Map<String, dynamic> Json) =>
      _$PolynomialSet2FromJson(Json);
  Map<String, dynamic> toJson() => _$PolynomialSet2ToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  Chapter? chapter;
  List<Videos>? videos;
  int? nVideos;
  String? subjectName;
  int? subjectId;
  String? subjectSlug;
  String? chapterName;
  int? topicId;
  int? chapterId;
  String? chapterSlug;
  int? id;
  String? name;
  String? bucketCutoffs;
  String? scoringMatrix;
  String? status;
  String? totalDuration;
  String? activePage;
  List<VideoRatings>? videoRatings;
  String? videosIconIdentifier;
  int? progress;
  bool? isKlassSubscribed;
  bool? isModuleSubscribed;
  String? description;
  String? lockType;
  int? sequenceNo;
  String? levelInfo;
  int? nLevels;
  bool? goalPracticed;
  bool? isLocked;
  List<Stories>? stories;
  int? nStories;
  String? storiesIconIdentifier;

  Data(
      {this.chapter,
      this.videos,
      this.nVideos,
      this.subjectName,
      this.subjectId,
      this.subjectSlug,
      this.chapterName,
      this.topicId,
      this.chapterId,
      this.chapterSlug,
      this.id,
      this.name,
      this.bucketCutoffs,
      this.scoringMatrix,
      this.status,
      this.totalDuration,
      this.activePage,
      this.videoRatings,
      this.videosIconIdentifier,
      this.progress,
      this.isKlassSubscribed,
      this.isModuleSubscribed,
      this.description,
      this.lockType,
      this.sequenceNo,
      this.levelInfo,
      this.nLevels,
      this.goalPracticed,
      this.isLocked,
      this.stories,
      this.nStories,
      this.storiesIconIdentifier});
  factory Data.fromJson(Map<String, dynamic> Json) => _$DataFromJson(Json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class Chapter {
  String? name;
  int? parentId;
  String? subjectName;
  String? subjectSlug;
  int? subjectId;
  String? slug;
  int? sequence;
  int? id;
  int? difficultyLevel;
  int? requiredEffort;
  int? goalCount;
  String? status;
  bool? hasLectures;
  int? nStories;
  bool? hasLearningSources;
  bool? hasLearningSourcesVideo;
  bool? hasLearningSourcesLinks;
  bool? hasConcepts;
  bool? hasNcertSolutions;
  bool? hasQuestionSets;
  bool? hasReport;
  int? percentageCompletion;

  Chapter(
      {this.name,
      this.parentId,
      this.subjectName,
      this.subjectSlug,
      this.subjectId,
      this.slug,
      this.sequence,
      this.id,
      this.difficultyLevel,
      this.requiredEffort,
      this.goalCount,
      this.status,
      this.hasLectures,
      this.nStories,
      this.hasLearningSources,
      this.hasLearningSourcesVideo,
      this.hasLearningSourcesLinks,
      this.hasConcepts,
      this.hasNcertSolutions,
      this.hasQuestionSets,
      this.hasReport,
      this.percentageCompletion});
  factory Chapter.fromJson(Map<String, dynamic> Json) =>
      _$ChapterFromJson(Json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

@JsonSerializable(createToJson: true)
class Videos {
  String? author;
  int? avgRating;
  String? createdOn;
  String? duration;
  String? description;
  int? id;
  String? uniqueKey;
  String? language;
  String? lastPublishedOn;
  String? provider;
  String? status;
  int? size;
  String? title;
  String? url;
  String? videoType;
  String? thumbnail;
  bool? isStoryLinked;
  dynamic storyId;
  String? source;
  int? durationS;
  String? durationMin;
  bool? isDownloadable;
  Thumbnails? thumbnails;
  List<Languages>? languages;
  String? defaultLanguage;
  String? youtubeId;
  dynamic youtubeDemoId;
  int? sequenceNo;
  String? youtubeUrl;
  bool? isWatched;
  bool? isBookmarked;
  String? lockType;
  bool? isLocked;
  int? watchTime;
  double? videoWatchedPercentage;
  String? lastWatchedTime;

  Videos(
      {this.author,
      this.avgRating,
      this.createdOn,
      this.duration,
      this.description,
      this.id,
      this.uniqueKey,
      this.language,
      this.lastPublishedOn,
      this.provider,
      this.status,
      this.size,
      this.title,
      this.url,
      this.videoType,
      this.thumbnail,
      this.isStoryLinked,
      this.storyId,
      this.source,
      this.durationS,
      this.durationMin,
      this.isDownloadable,
      this.thumbnails,
      this.languages,
      this.defaultLanguage,
      this.youtubeId,
      this.youtubeDemoId,
      this.sequenceNo,
      this.youtubeUrl,
      this.isWatched,
      this.isBookmarked,
      this.lockType,
      this.isLocked,
      this.watchTime,
      this.videoWatchedPercentage,
      this.lastWatchedTime});
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
class Languages {
  String? language;
  String? languageAbbr;
  String? youtubeId;
  String? duration;
  String? durationMin;
  int? id;
  String? deliverySource;
  SourceUrls? sourceUrls;
  String? rating;

  Languages(
      {this.language,
      this.languageAbbr,
      this.youtubeId,
      this.duration,
      this.durationMin,
      this.id,
      this.deliverySource,
      this.sourceUrls,
      this.rating});
  factory Languages.fromJson(Map<String, dynamic> Json) =>
      _$LanguagesFromJson(Json);
  Map<String, dynamic> toJson() => _$LanguagesToJson(this);
}

@JsonSerializable(createToJson: true)
class SourceUrls {
  String? youtube;
  String? limelight;

  SourceUrls({this.youtube, this.limelight});

  factory SourceUrls.fromJson(Map<String, dynamic> Json) =>
      _$SourceUrlsFromJson(Json);
  Map<String, dynamic> toJson() => _$SourceUrlsToJson(this);
}

@JsonSerializable(createToJson: true)
class VideoRatings {
  String? value;
  String? label;
  String? iconType;

  VideoRatings({this.value, this.label, this.iconType});
  factory VideoRatings.fromJson(Map<String, dynamic> Json) =>
      _$VideoRatingsFromJson(Json);
  Map<String, dynamic> toJson() => _$VideoRatingsToJson(this);
}

@JsonSerializable(createToJson: true)
class Stories {
  int? id;
  String? title;
  String? readTime;
  bool? isLocked;
  ThumbnailUrl? thumbnailUrl;
  int? sequenceNo;
  bool? hasSeen;
  String? lockType;
  bool? isKlassSubscribed;
  bool? isModuleSubscribed;

  Stories(
      {this.id,
      this.title,
      this.readTime,
      this.isLocked,
      this.thumbnailUrl,
      this.sequenceNo,
      this.hasSeen,
      this.lockType,
      this.isKlassSubscribed,
      this.isModuleSubscribed});
  factory Stories.fromJson(Map<String, dynamic> Json) =>
      _$StoriesFromJson(Json);
  Map<String, dynamic> toJson() => _$StoriesToJson(this);
}

@JsonSerializable(createToJson: true)
class ThumbnailUrl {
  int? id;
  String? hexcode;
  Webp? webp;
  Jpeg? jpeg;

  ThumbnailUrl({this.id, this.hexcode, this.webp, this.jpeg});
  factory ThumbnailUrl.fromJson(Map<String, dynamic> Json) =>
      _$ThumbnailUrlFromJson(Json);
  Map<String, dynamic> toJson() => _$ThumbnailUrlToJson(this);
}

@JsonSerializable(createToJson: true)
class Webp {
  String? s350;
  Webp({this.s350});
  factory Webp.fromJson(Map<String, dynamic> Json) => _$WebpFromJson(Json);
  Map<String, dynamic> toJson() => _$WebpToJson(this);
}

@JsonSerializable(createToJson: true)
class Jpeg {
  String? s120;
  String? s240;
  String? s360;
  String? s640;

  Jpeg({this.s120, this.s240, this.s360, this.s640});
  factory Jpeg.fromJson(Map<String, dynamic> Json) => _$JpegFromJson(Json);
  Map<String, dynamic> toJson() => _$JpegToJson(this);
}
