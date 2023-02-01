// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) => ListModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => DataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'data': instance.data,
    };
