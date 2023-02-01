import 'package:note_app/model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:note_app/network_services/url.dart';

abstract class ApiCalls {
  Future<DataModel?> createNote(DataModel dataModel);
  Future<List<DataModel>> getAllNotes();
  // Future<DataModel> updateNote(DataModel dataModel);
  // Future<void> deleteNote(String id);
}

class DioCrud extends ApiCalls {
  final Dio dio = Dio();
  final Url url = Url();
  DioCrud() {
    // dio.options = BaseOptions(
    //   baseUrl: url.baseUrl,
    //   responseType: ResponseType.plain,
    // );
  }

  @override
  Future<DataModel?> createNote(DataModel dataModel) async {
    DataModel? responseDataModel;
    try {
      Response response = await dio.post(
        url.baseUrl + url.createNote,
        data: dataModel.toJson(),
      );
      print(response.data);
      responseDataModel = DataModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return responseDataModel;
  }

  @override
  Future<List<DataModel>> getAllNotes() async {
    Response response = await dio.get(url.baseUrl+url.getAllNotes);
    print(response.data);
    DataModel.fromJson(response.data);
    return [];
  }

  // @override
  // Future<DataModel> updateNote(DataModel dataModel) {
  //   //
  // }

  // @override
  // Future<void> deleteNote(String id) {
  //   //
  // }
}
