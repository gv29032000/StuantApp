// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'select_class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SelectClass _$SelectClassFromJson(Map<String, dynamic> json) => SelectClass(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errorCode: json['errorCode'] as String?,
    );

Map<String, dynamic> _$SelectClassToJson(SelectClass instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      klassesList: (json['klassesList'] as List<dynamic>?)
          ?.map((e) => KlassesList.fromJson(e as Map<String, dynamic>))
          .toList(),
      cityList: (json['cityList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      countryList: (json['countryList'] as List<dynamic>?)
          ?.map((e) => CountryList.fromJson(e as Map<String, dynamic>))
          .toList(),
      demoDatesList: (json['demoDatesList'] as List<dynamic>?)
          ?.map((e) => DemoDatesList.fromJson(e as Map<String, dynamic>))
          .toList(),
      demoTimeSlotsList: (json['demoTimeSlotsList'] as List<dynamic>?)
          ?.map((e) => DemoTimeSlotsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] == null
          ? null
          : CurrentPage.fromJson(json['currentPage'] as Map<String, dynamic>),
      campaignId: json['campaignId'] as int?,
      selectedValues: json['selectedValues'] == null
          ? null
          : SelectedValues.fromJson(
              json['selectedValues'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'klassesList': instance.klassesList,
      'cityList': instance.cityList,
      'countryList': instance.countryList,
      'demoDatesList': instance.demoDatesList,
      'demoTimeSlotsList': instance.demoTimeSlotsList,
      'currentPage': instance.currentPage,
      'campaignId': instance.campaignId,
      'selectedValues': instance.selectedValues,
    };

KlassesList _$KlassesListFromJson(Map<String, dynamic> json) => KlassesList(
      id: json['id'] as int?,
      klass: json['klass'] as String?,
      klassInt: json['klassInt'] as int?,
    );

Map<String, dynamic> _$KlassesListToJson(KlassesList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'klass': instance.klass,
      'klassInt': instance.klassInt,
    };

CountryList _$CountryListFromJson(Map<String, dynamic> json) => CountryList(
      name: json['name'] as String?,
      isoCode: json['isoCode'] as String?,
      phoneCode: json['phoneCode'] as int?,
    );

Map<String, dynamic> _$CountryListToJson(CountryList instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isoCode': instance.isoCode,
      'phoneCode': instance.phoneCode,
    };

DemoDatesList _$DemoDatesListFromJson(Map<String, dynamic> json) =>
    DemoDatesList(
      id: json['id'] as int?,
      date: json['date'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$DemoDatesListToJson(DemoDatesList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'tag': instance.tag,
    };

DemoTimeSlotsList _$DemoTimeSlotsListFromJson(Map<String, dynamic> json) =>
    DemoTimeSlotsList(
      id: json['id'] as int?,
      slot: json['slot'] as String?,
      disabled: json['disabled'] as bool?,
    );

Map<String, dynamic> _$DemoTimeSlotsListToJson(DemoTimeSlotsList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slot': instance.slot,
      'disabled': instance.disabled,
    };

CurrentPage _$CurrentPageFromJson(Map<String, dynamic> json) => CurrentPage(
      screenId: json['screenId'] as int?,
      screenKey: json['screenKey'] as String?,
      entity: (json['entity'] as List<dynamic>?)
          ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isLastPage: json['isLastPage'] as bool?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      label: json['label'] as String?,
      prevCta: json['prevCta'] as String?,
      nextCta: json['nextCta'] as String?,
      finalCta: json['finalCta'] as String?,
      isMultiSelect: json['isMultiSelect'] as bool?,
      zeroCaseMessage: json['zeroCaseMessage'] as String?,
      optionalCta: json['optionalCta'] as String?,
      additionalCta: json['additionalCta'] as String?,
      isOptional: json['isOptional'] as bool?,
      showTwoButtons: json['showTwoButtons'] as bool?,
    );

Map<String, dynamic> _$CurrentPageToJson(CurrentPage instance) =>
    <String, dynamic>{
      'screenId': instance.screenId,
      'screenKey': instance.screenKey,
      'entity': instance.entity,
      'isLastPage': instance.isLastPage,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'label': instance.label,
      'prevCta': instance.prevCta,
      'nextCta': instance.nextCta,
      'finalCta': instance.finalCta,
      'isMultiSelect': instance.isMultiSelect,
      'zeroCaseMessage': instance.zeroCaseMessage,
      'optionalCta': instance.optionalCta,
      'additionalCta': instance.additionalCta,
      'isOptional': instance.isOptional,
      'showTwoButtons': instance.showTwoButtons,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      key: json['key'] as String?,
      title: json['title'] as String?,
      subTitle: json['subTitle'] as String?,
      isOptional: json['isOptional'] as bool?,
      isMultiSelect: json['isMultiSelect'] as bool?,
      additionalData: json['additionalData'] == null
          ? null
          : AdditionalData.fromJson(
              json['additionalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'key': instance.key,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'isOptional': instance.isOptional,
      'isMultiSelect': instance.isMultiSelect,
      'additionalData': instance.additionalData,
    };

AdditionalData _$AdditionalDataFromJson(Map<String, dynamic> json) =>
    AdditionalData();

Map<String, dynamic> _$AdditionalDataToJson(AdditionalData instance) =>
    <String, dynamic>{};

SelectedValues _$SelectedValuesFromJson(Map<String, dynamic> json) =>
    SelectedValues(
      parentPhone: json['parentPhone'] as String?,
      parentCountryIsoCode: json['parentCountryIsoCode'] as String?,
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SelectedValuesToJson(SelectedValues instance) =>
    <String, dynamic>{
      'parentPhone': instance.parentPhone,
      'parentCountryIsoCode': instance.parentCountryIsoCode,
      'location': instance.location,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      isInDefaultList: json['isInDefaultList'] as bool?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'isInDefaultList': instance.isInDefaultList,
    };
