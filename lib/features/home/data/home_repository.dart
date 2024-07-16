import 'package:dio/dio.dart';
import 'package:space_explorer/core/init/models/planet_model.dart';
import 'package:space_explorer/core/init/network/model/response_model.dart';
import 'package:space_explorer/core/init/network/network_manager.dart';

class HomeRepository {
  final NetworkManager _networkManager = NetworkManager();

  Future<ResponseModel> fetchPlanets() async {
    try {
      Response response = await _networkManager.get("/planets");
      if (response.statusCode == 200 && response.data != null && response.data[0] is Map<String, dynamic>) {
        List<PlanetModel> data = (response.data as List).map((e) => PlanetModel.fromJson(e)).toList();
        return ResponseModel(data: data, isError: false);
      } else {
        throw Exception("An error occurred while fetching planets");
      }
      
    } catch (e) {
      return ResponseModel(isError: true, message: e.toString());
    }
  }
}