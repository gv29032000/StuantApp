// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'poly_concepts.g.dart';

@JsonSerializable(createToJson: true)
class PolynomialConcepts {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;

  PolynomialConcepts(
      {this.data, this.status, this.statusCode, this.message, this.errorCode});
  factory PolynomialConcepts.fromJson(Map<String, dynamic> Json) =>
      _$PolynomialConceptsFromJson(Json);
  Map<String, dynamic> toJson() => _$PolynomialConceptsToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  String? tab;
  List<Concepts>? concepts;
  Subject? subject;
  Subject? chapter;

  Data({this.tab, this.concepts, this.subject, this.chapter});
  factory Data.fromJson(Map<String, dynamic> Json) => _$DataFromJson(Json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class Concepts {
  int? id;
  String? title;
  String? text;
  String? type;
  String? image;
  bool? isLocked;
  bool? isBookmarked;

  Concepts(
      {this.id,
      this.title,
      this.text,
      this.type,
      this.image,
      this.isLocked,
      this.isBookmarked});
  factory Concepts.fromJson(Map<String, dynamic> Json) =>
      _$ConceptsFromJson(Json);
  Map<String, dynamic> toJson() => _$ConceptsToJson(this);
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
