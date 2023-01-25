// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previous_paper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PreviousQuestionPapers _$PreviousQuestionPapersFromJson(
        Map<String, dynamic> json) =>
    PreviousQuestionPapers(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PreviousQuestionPapersToJson(
        PreviousQuestionPapers instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      hasFullAccess: json['hasFullAccess'] as bool?,
      testSource: json['testSource'] as String?,
      pageTitle: json['pageTitle'] as String?,
      klassSlug: json['klassSlug'] as String?,
      nQuestions: json['nQuestions'] as int?,
      page: json['page'] as int?,
      start: json['start'] as int?,
      end: json['end'] as int?,
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => Questions.fromJson(e as Map<String, dynamic>))
          .toList(),
      testType: json['testType'] as String?,
      questionSet: json['questionSet'] == null
          ? null
          : QuestionSet.fromJson(json['questionSet'] as Map<String, dynamic>),
      questionsPerPage: json['questionsPerPage'] as int?,
      filters: (json['filters'] as List<dynamic>?)
          ?.map((e) => Filters.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      chapter: json['chapter'] == null
          ? null
          : Chapter.fromJson(json['chapter'] as Map<String, dynamic>),
      tab: json['tab'] as String?,
      activePage: json['activePage'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'hasFullAccess': instance.hasFullAccess,
      'testSource': instance.testSource,
      'pageTitle': instance.pageTitle,
      'klassSlug': instance.klassSlug,
      'nQuestions': instance.nQuestions,
      'page': instance.page,
      'start': instance.start,
      'end': instance.end,
      'questions': instance.questions,
      'testType': instance.testType,
      'questionSet': instance.questionSet,
      'questionsPerPage': instance.questionsPerPage,
      'filters': instance.filters,
      'subject': instance.subject,
      'chapter': instance.chapter,
      'tab': instance.tab,
      'activePage': instance.activePage,
    };

Questions _$QuestionsFromJson(Map<String, dynamic> json) => Questions(
      isBookmarked: json['isBookmarked'] as bool?,
      question: json['question'] as String?,
      questionStyle: json['questionStyle'] as String?,
      passage: json['passage'] as String?,
      passageImage: json['passageImage'] as String?,
      passageHeader: json['passageHeader'] as String?,
      passageFooter: json['passageFooter'] as String?,
      assertion: json['assertion'] as String?,
      reason: json['reason'] as String?,
      questionId: json['questionId'] as int?,
      alreadyAttempted: json['alreadyAttempted'] as bool?,
      correctlyAnswered: json['correctlyAnswered'] as bool?,
      questionImage: json['questionImage'] as String?,
      hint: json['hint'] as String?,
      hintImage: json['hintImage'] as String?,
      questionStatus: json['questionStatus'] as String?,
      solution: json['solution'] as String?,
      solutionImage: json['solutionImage'] as String?,
      status: $enumDecodeNullable(_$AnswerStatusEnumMap, json['status']),
      selectedAns:
          (json['selectedAns'] as List<dynamic>?)?.map((e) => e as int).toSet(),
      attemptedAnswer: (json['attemptedAnswer'] as List<dynamic>?)
          ?.map((e) => e as bool)
          .toList(),
      showSolution: json['showSolution'] as bool?,
      solutionShown: json['solutionShown'] as bool?,
      choices: (json['choices'] as List<dynamic>?)
          ?.map((e) => Choices.fromJson(e as Map<String, dynamic>))
          .toList(),
      multipleCorrect: json['multipleCorrect'] as bool?,
      hintAvailable: json['hintAvailable'] as bool?,
      solutionAvailable: json['solutionAvailable'] as bool?,
      isSelected: json['isSelected'] as bool?,
      questionLinked: json['questionLinked'] as bool?,
      questionLevel: json['questionLevel'] as int?,
      questionLoIds: (json['questionLoIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      solutionId: json['solutionId'] as int?,
      subjectIds:
          (json['subjectIds'] as List<dynamic>?)?.map((e) => e as int).toList(),
      subjectNames: (json['subjectNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      canAskDoubt: json['canAskDoubt'] as bool?,
      sequenceNo: json['sequenceNo'] as int?,
      level: json['level'] as int?,
      solutionRating: json['solutionRating'] as int?,
      disableBookmark: json['disableBookmark'] as bool?,
      lastAttemptedOn: json['lastAttemptedOn'] as String?,
    );

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'isBookmarked': instance.isBookmarked,
      'question': instance.question,
      'questionStyle': instance.questionStyle,
      'passage': instance.passage,
      'passageImage': instance.passageImage,
      'passageHeader': instance.passageHeader,
      'passageFooter': instance.passageFooter,
      'assertion': instance.assertion,
      'reason': instance.reason,
      'questionId': instance.questionId,
      'alreadyAttempted': instance.alreadyAttempted,
      'correctlyAnswered': instance.correctlyAnswered,
      'questionImage': instance.questionImage,
      'hint': instance.hint,
      'hintImage': instance.hintImage,
      'questionStatus': instance.questionStatus,
      'solution': instance.solution,
      'solutionImage': instance.solutionImage,
      'choices': instance.choices,
      'multipleCorrect': instance.multipleCorrect,
      'hintAvailable': instance.hintAvailable,
      'solutionAvailable': instance.solutionAvailable,
      'questionLinked': instance.questionLinked,
      'questionLevel': instance.questionLevel,
      'questionLoIds': instance.questionLoIds,
      'solutionId': instance.solutionId,
      'subjectIds': instance.subjectIds,
      'subjectNames': instance.subjectNames,
      'canAskDoubt': instance.canAskDoubt,
      'sequenceNo': instance.sequenceNo,
      'level': instance.level,
      'solutionRating': instance.solutionRating,
      'disableBookmark': instance.disableBookmark,
      'lastAttemptedOn': instance.lastAttemptedOn,
      'showSolution': instance.showSolution,
      'solutionShown': instance.solutionShown,
      'isSelected': instance.isSelected,
      'status': _$AnswerStatusEnumMap[instance.status],
      'selectedAns': instance.selectedAns?.toList(),
      'attemptedAnswer': instance.attemptedAnswer,
    };

const _$AnswerStatusEnumMap = {
  AnswerStatus.correct: 'correct',
  AnswerStatus.wrong: 'wrong',
  AnswerStatus.answered: 'answered',
  AnswerStatus.notanswered: 'notanswered',
  AnswerStatus.selected: 'selected',
  AnswerStatus.obs: 'obs',
};

Choices _$ChoicesFromJson(Map<String, dynamic> json) => Choices(
      label: json['label'] as String?,
      choiceId: json['choiceId'] as int?,
      choice: json['choice'] as String?,
      image: json['image'] as String?,
      isRight: json['isRight'] as bool?,
      isSelect1: json['isSelect1'] as bool?,
    );

Map<String, dynamic> _$ChoicesToJson(Choices instance) => <String, dynamic>{
      'label': instance.label,
      'choiceId': instance.choiceId,
      'choice': instance.choice,
      'image': instance.image,
      'isRight': instance.isRight,
      'isSelect1': instance.isSelect1,
    };

QuestionSet _$QuestionSetFromJson(Map<String, dynamic> json) => QuestionSet(
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$QuestionSetToJson(QuestionSet instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
    };

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      type: json['type'] as String?,
      title: json['title'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Options.fromJson(e as Map<String, dynamic>))
          .toList(),
      isMultiSelect: json['isMultiSelect'] as bool?,
      allowGroupDisable: json['allowGroupDisable'] as bool?,
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'options': instance.options,
      'isMultiSelect': instance.isMultiSelect,
      'allowGroupDisable': instance.allowGroupDisable,
    };

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      label: json['label'] as String?,
      key: json['key'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$OptionsToJson(Options instance) => <String, dynamic>{
      'label': instance.label,
      'key': instance.key,
      'count': instance.count,
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      name: json['name'] as String?,
      id: json['id'] as int?,
      slug: json['slug'] as String?,
      sequence: json['sequence'] as int?,
      goalCount: json['goalCount'] as int?,
      inSyllabusLoIds: (json['inSyllabusLoIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      status: json['status'] as String?,
      inSyllabusTuV2Ids: (json['inSyllabusTuV2Ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'slug': instance.slug,
      'sequence': instance.sequence,
      'goalCount': instance.goalCount,
      'inSyllabusLoIds': instance.inSyllabusLoIds,
      'status': instance.status,
      'inSyllabusTuV2Ids': instance.inSyllabusTuV2Ids,
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
      status: json['status'] as String?,
      inSyllabusTuV2Ids: (json['inSyllabusTuV2Ids'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      hasQuestionSets: json['hasQuestionSets'] as bool?,
      hasReport: json['hasReport'] as bool?,
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
      'status': instance.status,
      'inSyllabusTuV2Ids': instance.inSyllabusTuV2Ids,
      'hasQuestionSets': instance.hasQuestionSets,
      'hasReport': instance.hasReport,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta();

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{};
