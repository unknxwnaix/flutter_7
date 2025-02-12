import 'package:auto/features/home/domain/entity/celebrity_entity.dart';
import 'package:auto/features/home/domain/repository/home_repository.dart';

class HomeUseCase {
  final HomeRepository _repository;

  HomeUseCase(this._repository);

  Future<List<CelebrityEntity>> call() async {
    return await _repository.getAllCelebrities();
  }
}