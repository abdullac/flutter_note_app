import 'package:note_app/all_notes_page.dart';
import 'package:note_app/model/data_model.dart';
import 'package:dio/dio.dart';
import 'package:note_app/model/list_model.dart';
import 'package:note_app/network_services/url.dart';

abstract class ApiCalls {
  Future<DataModel?> createNote(DataModel dataModel);
  Future<List<DataModel>> getAllNotes();
  Future<DataModel?> updateNote(DataModel dataModel);
  Future<void> deleteNote(String id);
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

  DioCrud._internal();
  static DioCrud instance = DioCrud._internal();
  DioCrud factory() {
    return instance;
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
    // List<DataModel> listDataModel = [];
    ListModel responseListModel;
    try {
      Response response = await dio.get(url.baseUrl + url.getAllNotes);
      print(response.data);
      responseListModel = ListModel.fromJson(response.data);
      // listDataModel.addAll(responseListModel.data);
      listOfDataModelNotifier.value.clear();
      listOfDataModelNotifier.value.addAll(responseListModel.data.reversed);
      listOfDataModelNotifier.notifyListeners();
    } catch (e) {
      print(e);
    }
    return listOfDataModelNotifier.value;
  }

  @override
  Future<DataModel?> updateNote(DataModel dataModel) async {
    DataModel? resposeDataModel;
    try {
      Response response = await dio.put(
        url.baseUrl + url.updateNote,
        data: dataModel.toJson(),
      );
      print(response.data);
      resposeDataModel = DataModel.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    return resposeDataModel;
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      Response response = await dio
          .delete(url.baseUrl + url.deleteNote.replaceFirst("{id}", id));
      print("Deleted ${response.data}");
    } catch (e) {
      print(e);
    }
  }
}
