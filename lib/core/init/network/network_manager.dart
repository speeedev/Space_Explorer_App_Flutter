import 'package:dio/dio.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() {
    return _instance;
  }
  late Dio _dio;

  NetworkManager._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://planet-app-api.onrender.com/',
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
    ));
  }

  Future get(String endpoint) async {
    final response = await _dio.get(endpoint);

    switch (response.statusCode) {
      case 200:
        return response;
      default:
        throw Exception("An error occurred while fetching data");
    }
  }
}
