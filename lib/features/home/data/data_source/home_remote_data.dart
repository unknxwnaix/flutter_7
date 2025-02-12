import '../model/celebrity_model.dart';
import 'package:auto/core/network/dio_client.dart';

abstract class HomeRemoteData {
  Future<List<CelebrityModel>> getAllCelebrities();
}

class HomeRemoteDataImpl implements HomeRemoteData {
  final DioClient _dioClient;

  HomeRemoteDataImpl(this._dioClient);

  @override
  Future<List<CelebrityModel>> getAllCelebrities() async {
    try {
      final response = await _dioClient.dio.get('/v1/celebrity');
      print('Request URL: ${response.requestOptions.uri}');
      print('Response data: ${response.data}');
      return (response.data as List).map((json) => CelebrityModel.fromJson(json)).toList();
    } catch (e) {
      print('Failed to load celebrity data: $e');
      throw Exception('Failed to load celebrity data: $e');
    }
  }
}