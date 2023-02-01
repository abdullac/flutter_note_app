// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      sId: json['_id'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      '_id': instance.sId,
      'title': instance.title,
      'content': instance.content,
    };
