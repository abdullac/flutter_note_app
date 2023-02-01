import 'package:json_annotation/json_annotation.dart';
import 'package:note_app/model/data_model.dart';

part 'list_model.g.dart';

@JsonSerializable()
class ListModel {
  @JsonKey(name: "data")
  List<DataModel> data;

  ListModel({this.data = const []});

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);
}



