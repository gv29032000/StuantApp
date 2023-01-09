// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'ncert_solutions.g.dart';

@JsonSerializable(createToJson: true)
class PolyNCERTSolutions {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;
  Meta? meta;

  PolyNCERTSolutions(
      {this.data,
      this.status,
      this.statusCode,
      this.message,
      this.errorCode,
      this.meta});
  factory PolyNCERTSolutions.fromJson(Map<String, dynamic> Json) =>
      _$PolyNCERTSolutionsFromJson(Json);
  Map<String, dynamic> toJson() => _$PolyNCERTSolutionsToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  bool? hasFullAccess;
  String? testSource;
  String? pageTitle;
  String? klassSlug;
  int? nQuestions;
  int? page;
  int? start;
  int? end;
  List<Questions>? questions;
  String? testType;
  QuestionSet? questionSet;
  int? questionsPerPage;
  List<Filters>? filters;
  Subject? subject;
  Chapter? chapter;
  String? tab;
  String? activePage;

  Data(
      {this.hasFullAccess,
      this.testSource,
      this.pageTitle,
      this.klassSlug,
      this.nQuestions,
      this.page,
      this.start,
      this.end,
      this.questions,
      this.testType,
      this.questionSet,
      this.questionsPerPage,
      this.filters,
      this.subject,
      this.chapter,
      this.tab,
      this.activePage});
  factory Data.fromJson(Map<String, dynamic> Json) => _$DataFromJson(Json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class Questions {
  bool? isBookmarked;
  String? question;
  String? questionStyle;
  String? passage;
  String? passageImage;
  String? passageHeader;
  String? passageFooter;
  String? assertion;
  String? reason;
  bool? showSolution;
  bool? solutionShown;
  int? questionId;
  String? bloom;
  bool? alreadyAttempted;
  bool? correctlyAnswered;
  String? questionImage;
  String? hint;
  String? hintImage;
  String? questionStatus;
  String? solution;
  String? solutionImage;
  List<dynamic>? solutionLinks;
  List<dynamic>? choices;
  bool? multipleCorrect;
  bool? hintAvailable;
  bool? solutionAvailable;
  dynamic questionLinkedToId;
  bool? questionLinked;
  int? questionLevel;
  List<int>? questionLoIds;
  int? solutionId;
  List<int>? subjectIds;
  List<String>? subjectNames;
  bool? canAskDoubt;
  int? sequenceNo;
  int? level;
  int? solutionRating;
  bool? disableBookmark;
  String? lastAttemptedOn;

  Questions(
      {this.isBookmarked,
      this.question,
      this.questionStyle,
      this.passage,
      this.passageImage,
      this.passageHeader,
      this.passageFooter,
      this.assertion,
      this.solutionShown,
      this.reason,
      this.questionId,
      this.bloom,
      this.alreadyAttempted,
      this.correctlyAnswered,
      this.questionImage,
      this.hint,
      this.hintImage,
      this.questionStatus,
      this.solution,
      this.solutionImage,
      this.solutionLinks,
      this.showSolution,
      this.choices,
      this.multipleCorrect,
      this.hintAvailable,
      this.solutionAvailable,
      this.questionLinkedToId,
      this.questionLinked,
      this.questionLevel,
      this.questionLoIds,
      this.solutionId,
      this.subjectIds,
      this.subjectNames,
      this.canAskDoubt,
      this.sequenceNo,
      this.level,
      this.solutionRating,
      this.disableBookmark,
      this.lastAttemptedOn});
  factory Questions.fromJson(Map<String, dynamic> Json) =>
      _$QuestionsFromJson(Json);
  Map<String, dynamic> toJson() => _$QuestionsToJson(this);
}

@JsonSerializable(createToJson: true)
class QuestionSet {
  String? name;
  String? slug;

  QuestionSet({this.name, this.slug});
  factory QuestionSet.fromJson(Map<String, dynamic> Json) =>
      _$QuestionSetFromJson(Json);
  Map<String, dynamic> toJson() => _$QuestionSetToJson(this);
}

@JsonSerializable(createToJson: true)
class Filters {
  String? type;
  String? title;
  List<Options>? options;
  bool? isMultiSelect;
  bool? allowGroupDisable;

  Filters(
      {this.type,
      this.title,
      this.options,
      this.isMultiSelect,
      this.allowGroupDisable});
  factory Filters.fromJson(Map<String, dynamic> Json) =>
      _$FiltersFromJson(Json);
  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}

@JsonSerializable(createToJson: true)
class Options {
  String? label;
  String? key;
  int? count;

  Options({this.label, this.key, this.count});
  factory Options.fromJson(Map<String, dynamic> Json) =>
      _$OptionsFromJson(Json);
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

@JsonSerializable(createToJson: true)
class Subject {
  String? name;
  int? id;
  String? slug;
  int? sequence;
  int? goalCount;
  List<int>? inSyllabusLoIds;
  String? status;
  List<dynamic>? inSyllabusTuIds;
  List<int>? inSyllabusTuV2Ids;

  Subject(
      {this.name,
      this.id,
      this.slug,
      this.sequence,
      this.goalCount,
      this.inSyllabusLoIds,
      this.status,
      this.inSyllabusTuIds,
      this.inSyllabusTuV2Ids});
  factory Subject.fromJson(Map<String, dynamic> Json) =>
      _$SubjectFromJson(Json);
  Map<String, dynamic> toJson() => _$SubjectToJson(this);
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
  String? status;
  List<int>? inSyllabusTuV2Ids;
  bool? hasQuestionSets;
  bool? hasReport;

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
      this.status,
      this.inSyllabusTuV2Ids,
      this.hasQuestionSets,
      this.hasReport});
  factory Chapter.fromJson(Map<String, dynamic> Json) =>
      _$ChapterFromJson(Json);
  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

@JsonSerializable(createToJson: true)
class Meta {
  Meta({dynamic});
  factory Meta.fromJson(Map<String, dynamic> Json) => _$MetaFromJson(Json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
