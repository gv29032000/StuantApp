import 'package:json_annotation/json_annotation.dart';

part 'select_class.g.dart';

@JsonSerializable(createToJson: true)
class SelectClass {
  Data? data;
  String? status;
  int? statusCode;
  String? message;
  String? errorCode;

  SelectClass(
      {this.data, this.status, this.statusCode, this.message, this.errorCode});

  factory SelectClass.fromJson(Map<String, dynamic> json) =>
      _$SelectClassFromJson(json);
  Map<String, dynamic> toJson() => _$SelectClassToJson(this);
}

@JsonSerializable(createToJson: true)
class Data {
  List<KlassesList>? klassesList;
  List<String>? cityList;
  List<CountryList>? countryList;
  List<DemoDatesList>? demoDatesList;
  List<DemoTimeSlotsList>? demoTimeSlotsList;
  CurrentPage? currentPage;
  int? campaignId;
  SelectedValues? selectedValues;

  Data(
      {this.klassesList,
      this.cityList,
      this.countryList,
      this.demoDatesList,
      this.demoTimeSlotsList,
      this.currentPage,
      this.campaignId,
      this.selectedValues});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(createToJson: true)
class KlassesList {
  int? id;
  String? klass;
  int? klassInt;

  KlassesList({this.id, this.klass, this.klassInt});

  factory KlassesList.fromJson(Map<String, dynamic> json) =>
      _$KlassesListFromJson(json);
  Map<String, dynamic> toJson() => _$KlassesListToJson(this);
}

@JsonSerializable(createToJson: true)
class CountryList {
  String? name;
  String? isoCode;
  int? phoneCode;

  CountryList({this.name, this.isoCode, this.phoneCode});

  factory CountryList.fromJson(Map<String, dynamic> json) =>
      _$CountryListFromJson(json);
  Map<String, dynamic> toJson() => _$CountryListToJson(this);
}

@JsonSerializable(createToJson: true)
class DemoDatesList {
  int? id;
  String? date;
  String? tag;

  DemoDatesList({this.id, this.date, this.tag});

  factory DemoDatesList.fromJson(Map<String, dynamic> json) =>
      _$DemoDatesListFromJson(json);
  Map<String, dynamic> toJson() => _$DemoDatesListToJson(this);
}

@JsonSerializable(createToJson: true)
class DemoTimeSlotsList {
  int? id;
  String? slot;
  bool? disabled;

  DemoTimeSlotsList({this.id, this.slot, this.disabled});

  factory DemoTimeSlotsList.fromJson(Map<String, dynamic> json) =>
      _$DemoTimeSlotsListFromJson(json);
  Map<String, dynamic> toJson() => _$DemoTimeSlotsListToJson(this);
}

@JsonSerializable(createToJson: true)
class CurrentPage {
  int? screenId;
  String? screenKey;
  // Null? prevKey;
  // List<Null>? values;
  // List<Null>? popularValues;
  List<Entity>? entity;
  bool? isLastPage;
  String? title;
  String? subTitle;
  String? label;
  String? prevCta;
  String? nextCta;
  String? finalCta;
  bool? isMultiSelect;
  String? zeroCaseMessage;
  String? optionalCta;
  String? additionalCta;
  bool? isOptional;
  bool? showTwoButtons;

  CurrentPage(
      {this.screenId,
      this.screenKey,
      // this.prevKey,
      // this.values,
      // this.popularValues,
      this.entity,
      this.isLastPage,
      this.title,
      this.subTitle,
      this.label,
      this.prevCta,
      this.nextCta,
      this.finalCta,
      this.isMultiSelect,
      this.zeroCaseMessage,
      this.optionalCta,
      this.additionalCta,
      this.isOptional,
      this.showTwoButtons});

  factory CurrentPage.fromJson(Map<String, dynamic> json) =>
      _$CurrentPageFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentPageToJson(this);
}

@JsonSerializable(createToJson: true)
class Entity {
  String? key;
  String? title;
  String? subTitle;
  bool? isOptional;
  bool? isMultiSelect;
  // List<Null>? values;
  // List<Null>? popularValues;
  AdditionalData? additionalData;

  Entity(
      {this.key,
      this.title,
      this.subTitle,
      this.isOptional,
      this.isMultiSelect,
      // this.values,
      // this.popularValues,
      this.additionalData});

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}

@JsonSerializable(createToJson: true)
class AdditionalData {
  AdditionalData({dynamic});

  factory AdditionalData.fromJson(Map<String, dynamic> json) =>
      _$AdditionalDataFromJson(json);
  Map<String, dynamic> toJson() => _$AdditionalDataToJson(this);
}

@JsonSerializable(createToJson: true)
class SelectedValues {
  String? parentPhone;
  String? parentCountryIsoCode;
  // Null? parentEmail;
  Location? location;

  SelectedValues(
      {this.parentPhone,
      this.parentCountryIsoCode,
      // this.parentEmail,
      this.location});

  factory SelectedValues.fromJson(Map<String, dynamic> json) =>
      _$SelectedValuesFromJson(json);
  Map<String, dynamic> toJson() => _$SelectedValuesToJson(this);
}

@JsonSerializable(createToJson: true)
class Location {
  String? name;
  bool? isInDefaultList;

  Location({this.name, this.isInDefaultList});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
