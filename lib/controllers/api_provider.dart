import 'package:flutter/material.dart';
import 'package:seclob/model/api_model.dart';
import 'package:seclob/service/api_service.dart';

class ApiProvider extends ChangeNotifier {
  final ApiService apiservice = ApiService();
  List<ApiModel>? datas = [];
  Future<List<ApiModel>> fetchData() async {
    try {
      datas = await apiservice.getData();
      print('datas are${apiservice.getData()}');
      notifyListeners();
      return datas!;
    } catch (e) {
      notifyListeners();
      return [];
    }
  }
}
