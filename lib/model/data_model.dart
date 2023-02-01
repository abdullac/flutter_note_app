import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  @JsonKey(name: "_id")
  String? sId;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "content")
  String? content;

  DataModel({this.sId, this.title, this.content});

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}
