import '../entity/celebrity_entity.dart';

abstract class HomeRepository {
  Future<List<CelebrityEntity>> getAllCelebrities();
}

