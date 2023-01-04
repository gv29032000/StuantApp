// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poly_concepts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolynomialConcepts _$PolynomialConceptsFromJson(Map<String, dynamic> json) =>
    PolynomialConcepts(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$PolynomialConceptsToJson(PolynomialConcepts instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      tab: json['tab'] as String?,
      concepts: (json['concepts'] as List<dynamic>?)
          ?.map((e) => Concepts.fromJson(e as Map<String, dynamic>))
          .toList(),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
      chapter: json['chapter'] == null
          ? null
          : Subject.fromJson(json['chapter'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'tab': instance.tab,
      'concepts': instance.concepts,
      'subject': instance.subject,
      'chapter': instance.chapter,
    };

Concepts _$ConceptsFromJson(Map<String, dynamic> json) => Concepts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      text: json['text'] as String?,
      type: json['type'] as String?,
      image: json['image'] as String?,
      isLocked: json['isLocked'] as bool?,
      isBookmarked: json['isBookmarked'] as bool?,
    );

Map<String, dynamic> _$ConceptsToJson(Concepts instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'type': instance.type,
      'image': instance.image,
      'isLocked': instance.isLocked,
      'isBookmarked': instance.isBookmarked,
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
