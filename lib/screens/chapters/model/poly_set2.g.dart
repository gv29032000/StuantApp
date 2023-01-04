// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../model/poly_set2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolynomialSet2 _$PolynomialSet2FromJson(Map<String, dynamic> json) =>
    PolynomialSet2(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$PolynomialSet2ToJson(PolynomialSet2 instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => Videos.fromJson(e as Map<String, dynamic>))
          .toList(),
      nVideos: json['nVideos'] as int?,
      subjectName: json['subjectName'] as String?,
      subjectId: json['subjectId'] as int?,
      subjectSlug: json['subjectSlug'] as String?,
      chapterName: json['chapterName'] as String?,
      topicId: json['topicId'] as int?,
      chapterId: json['chapterId'] as int?,
      chapterSlug: json['chapterSlug'] as String?,
      id: json['id'] as int?,
      name: json['name'] as String?,
      bucketCutoffs: json['bucketCutoffs'] as String?,
      scoringMatrix: json['scoringMatrix'] as String?,
      status: json['status'] as String?,
      totalDuration: json['totalDuration'] as String?,
      activePage: json['activePage'] as String?,
      videoRatings: (json['videoRatings'] as List<dynamic>?)
          ?.map((e) => VideoRatings.fromJson(e as Map<String, dynamic>))
          .toList(),
      videosIconIdentifier: json['videosIconIdentifier'] as String?,
      progress: json['progress'] as int?,
      isKlassSubscribed: json['isKlassSubscribed'] as bool?,
      isModuleSubscribed: json['isModuleSubscribed'] as bool?,
      description: json['description'] as String?,
      lockType: json['lockType'] as String?,
      sequenceNo: json['sequenceNo'] as int?,
      levelInfo: json['levelInfo'] as String?,
      nLevels: json['nLevels'] as int?,
      goalPracticed: json['goalPracticed'] as bool?,
      isLocked: json['isLocked'] as bool?,
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => Stories.fromJson(e as Map<String, dynamic>))
          .toList(),
      nStories: json['nStories'] as int?,
      storiesIconIdentifier: json['storiesIconIdentifier'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'chapter': instance.chapter,
      'videos': instance.videos,
      'nVideos': instance.nVideos,
      'subjectName': instance.subjectName,
      'subjectId': instance.subjectId,
      'subjectSlug': instance.subjectSlug,
      'chapterName': instance.chapterName,
      'topicId': instance.topicId,
      'chapterId': instance.chapterId,
      'chapterSlug': instance.chapterSlug,
      'id': instance.id,
      'name': instance.name,
      'bucketCutoffs': instance.bucketCutoffs,
      'scoringMatrix': instance.scoringMatrix,
      'status': instance.status,
      'totalDuration': instance.totalDuration,
      'activePage': instance.activePage,
      'videoRatings': instance.videoRatings,
      'videosIconIdentifier': instance.videosIconIdentifier,
      'progress': instance.progress,
      'isKlassSubscribed': instance.isKlassSubscribed,
      'isModuleSubscribed': instance.isModuleSubscribed,
      'description': instance.description,
      'lockType': instance.lockType,
      'sequenceNo': instance.sequenceNo,
      'levelInfo': instance.levelInfo,
      'nLevels': instance.nLevels,
      'goalPracticed': instance.goalPracticed,
      'isLocked': instance.isLocked,
      'stories': instance.stories,
      'nStories': instance.nStories,
      'storiesIconIdentifier': instance.storiesIconIdentifier,
    };

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      name: json['name'] as String?,
      parentId: json['parentId'] as int?,
      subjectName: json['subjectName'] as String?,
      subjectSlug: json['subjectSlug'] as String?,
      subjectId: json['subjectId'] as int?,
      slug: json['slug'] as String?,
      sequence: json['sequence'] as int?,
      id: json['id'] as int?,
      difficultyLevel: json['difficultyLevel'] as int?,
      requiredEffort: json['requiredEffort'] as int?,
      goalCount: json['goalCount'] as int?,
      status: json['status'] as String?,
      hasLectures: json['hasLectures'] as bool?,
      nStories: json['nStories'] as int?,
      hasLearningSources: json['hasLearningSources'] as bool?,
      hasLearningSourcesVideo: json['hasLearningSourcesVideo'] as bool?,
      hasLearningSourcesLinks: json['hasLearningSourcesLinks'] as bool?,
      hasConcepts: json['hasConcepts'] as bool?,
      hasNcertSolutions: json['hasNcertSolutions'] as bool?,
      hasQuestionSets: json['hasQuestionSets'] as bool?,
      hasReport: json['hasReport'] as bool?,
      percentageCompletion: json['percentageCompletion'] as int?,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'name': instance.name,
      'parentId': instance.parentId,
      'subjectName': instance.subjectName,
      'subjectSlug': instance.subjectSlug,
      'subjectId': instance.subjectId,
      'slug': instance.slug,
      'sequence': instance.sequence,
      'id': instance.id,
      'difficultyLevel': instance.difficultyLevel,
      'requiredEffort': instance.requiredEffort,
      'goalCount': instance.goalCount,
      'status': instance.status,
      'hasLectures': instance.hasLectures,
      'nStories': instance.nStories,
      'hasLearningSources': instance.hasLearningSources,
      'hasLearningSourcesVideo': instance.hasLearningSourcesVideo,
      'hasLearningSourcesLinks': instance.hasLearningSourcesLinks,
      'hasConcepts': instance.hasConcepts,
      'hasNcertSolutions': instance.hasNcertSolutions,
      'hasQuestionSets': instance.hasQuestionSets,
      'hasReport': instance.hasReport,
      'percentageCompletion': instance.percentageCompletion,
    };

Videos _$VideosFromJson(Map<String, dynamic> json) => Videos(
      author: json['author'] as String?,
      avgRating: json['avgRating'] as int?,
      createdOn: json['createdOn'] as String?,
      duration: json['duration'] as String?,
      description: json['description'] as String?,
      id: json['id'] as int?,
      uniqueKey: json['uniqueKey'] as String?,
      language: json['language'] as String?,
      lastPublishedOn: json['lastPublishedOn'] as String?,
      provider: json['provider'] as String?,
      status: json['status'] as String?,
      size: json['size'] as int?,
      title: json['title'] as String?,
      url: json['url'] as String?,
      videoType: json['videoType'] as String?,
      thumbnail: json['thumbnail'] as String?,
      isStoryLinked: json['isStoryLinked'] as bool?,
      storyId: json['storyId'],
      source: json['source'] as String?,
      durationS: json['durationS'] as int?,
      durationMin: json['durationMin'] as String?,
      isDownloadable: json['isDownloadable'] as bool?,
      thumbnails: json['thumbnails'] == null
          ? null
          : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>),
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => Languages.fromJson(e as Map<String, dynamic>))
          .toList(),
      defaultLanguage: json['defaultLanguage'] as String?,
      youtubeId: json['youtubeId'] as String?,
      youtubeDemoId: json['youtubeDemoId'],
      sequenceNo: json['sequenceNo'] as int?,
      youtubeUrl: json['youtubeUrl'] as String?,
      isWatched: json['isWatched'] as bool?,
      isBookmarked: json['isBookmarked'] as bool?,
      lockType: json['lockType'] as String?,
      isLocked: json['isLocked'] as bool?,
      watchTime: json['watchTime'] as int?,
      videoWatchedPercentage:
          (json['videoWatchedPercentage'] as num?)?.toDouble(),
      lastWatchedTime: json['lastWatchedTime'] as String?,
    );

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'author': instance.author,
      'avgRating': instance.avgRating,
      'createdOn': instance.createdOn,
      'duration': instance.duration,
      'description': instance.description,
      'id': instance.id,
      'uniqueKey': instance.uniqueKey,
      'language': instance.language,
      'lastPublishedOn': instance.lastPublishedOn,
      'provider': instance.provider,
      'status': instance.status,
      'size': instance.size,
      'title': instance.title,
      'url': instance.url,
      'videoType': instance.videoType,
      'thumbnail': instance.thumbnail,
      'isStoryLinked': instance.isStoryLinked,
      'storyId': instance.storyId,
      'source': instance.source,
      'durationS': instance.durationS,
      'durationMin': instance.durationMin,
      'isDownloadable': instance.isDownloadable,
      'thumbnails': instance.thumbnails,
      'languages': instance.languages,
      'defaultLanguage': instance.defaultLanguage,
      'youtubeId': instance.youtubeId,
      'youtubeDemoId': instance.youtubeDemoId,
      'sequenceNo': instance.sequenceNo,
      'youtubeUrl': instance.youtubeUrl,
      'isWatched': instance.isWatched,
      'isBookmarked': instance.isBookmarked,
      'lockType': instance.lockType,
      'isLocked': instance.isLocked,
      'watchTime': instance.watchTime,
      'videoWatchedPercentage': instance.videoWatchedPercentage,
      'lastWatchedTime': instance.lastWatchedTime,
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

Languages _$LanguagesFromJson(Map<String, dynamic> json) => Languages(
      language: json['language'] as String?,
      languageAbbr: json['languageAbbr'] as String?,
      youtubeId: json['youtubeId'] as String?,
      duration: json['duration'] as String?,
      durationMin: json['durationMin'] as String?,
      id: json['id'] as int?,
      deliverySource: json['deliverySource'] as String?,
      sourceUrls: json['sourceUrls'] == null
          ? null
          : SourceUrls.fromJson(json['sourceUrls'] as Map<String, dynamic>),
      rating: json['rating'] as String?,
    );

Map<String, dynamic> _$LanguagesToJson(Languages instance) => <String, dynamic>{
      'language': instance.language,
      'languageAbbr': instance.languageAbbr,
      'youtubeId': instance.youtubeId,
      'duration': instance.duration,
      'durationMin': instance.durationMin,
      'id': instance.id,
      'deliverySource': instance.deliverySource,
      'sourceUrls': instance.sourceUrls,
      'rating': instance.rating,
    };

SourceUrls _$SourceUrlsFromJson(Map<String, dynamic> json) => SourceUrls(
      youtube: json['youtube'] as String?,
      limelight: json['limelight'] as String?,
    );

Map<String, dynamic> _$SourceUrlsToJson(SourceUrls instance) =>
    <String, dynamic>{
      'youtube': instance.youtube,
      'limelight': instance.limelight,
    };

VideoRatings _$VideoRatingsFromJson(Map<String, dynamic> json) => VideoRatings(
      value: json['value'] as String?,
      label: json['label'] as String?,
      iconType: json['iconType'] as String?,
    );

Map<String, dynamic> _$VideoRatingsToJson(VideoRatings instance) =>
    <String, dynamic>{
      'value': instance.value,
      'label': instance.label,
      'iconType': instance.iconType,
    };

Stories _$StoriesFromJson(Map<String, dynamic> json) => Stories(
      id: json['id'] as int?,
      title: json['title'] as String?,
      readTime: json['readTime'] as String?,
      isLocked: json['isLocked'] as bool?,
      thumbnailUrl: json['thumbnailUrl'] == null
          ? null
          : ThumbnailUrl.fromJson(json['thumbnailUrl'] as Map<String, dynamic>),
      sequenceNo: json['sequenceNo'] as int?,
      hasSeen: json['hasSeen'] as bool?,
      lockType: json['lockType'] as String?,
      isKlassSubscribed: json['isKlassSubscribed'] as bool?,
      isModuleSubscribed: json['isModuleSubscribed'] as bool?,
    );

Map<String, dynamic> _$StoriesToJson(Stories instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'readTime': instance.readTime,
      'isLocked': instance.isLocked,
      'thumbnailUrl': instance.thumbnailUrl,
      'sequenceNo': instance.sequenceNo,
      'hasSeen': instance.hasSeen,
      'lockType': instance.lockType,
      'isKlassSubscribed': instance.isKlassSubscribed,
      'isModuleSubscribed': instance.isModuleSubscribed,
    };

ThumbnailUrl _$ThumbnailUrlFromJson(Map<String, dynamic> json) => ThumbnailUrl(
      id: json['id'] as int?,
      hexcode: json['hexcode'] as String?,
      webp: json['webp'] == null
          ? null
          : Webp.fromJson(json['webp'] as Map<String, dynamic>),
      jpeg: json['jpeg'] == null
          ? null
          : Jpeg.fromJson(json['jpeg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThumbnailUrlToJson(ThumbnailUrl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hexcode': instance.hexcode,
      'webp': instance.webp,
      'jpeg': instance.jpeg,
    };

Webp _$WebpFromJson(Map<String, dynamic> json) => Webp(
      s350: json['s350'] as String?,
    );

Map<String, dynamic> _$WebpToJson(Webp instance) => <String, dynamic>{
      's350': instance.s350,
    };

Jpeg _$JpegFromJson(Map<String, dynamic> json) => Jpeg(
      s120: json['s120'] as String?,
      s240: json['s240'] as String?,
      s360: json['s360'] as String?,
      s640: json['s640'] as String?,
    );

Map<String, dynamic> _$JpegToJson(Jpeg instance) => <String, dynamic>{
      's120': instance.s120,
      's240': instance.s240,
      's360': instance.s360,
      's640': instance.s640,
    };
