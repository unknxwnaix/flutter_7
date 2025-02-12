import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data.dart';
import '../../domain/entity/celebrity_entity.dart';
import '../mapper/celebrity_mapper.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteData _remoteData;

  HomeRepositoryImpl(this._remoteData);

  @override
  Future<List<CelebrityEntity>> getAllCelebrities() async {
    final celebrityModels = await _remoteData.getAllCelebrities();
    return celebrityModels.map((model) => model.toEntity()).toList();
  }
}