import 'package:auto/features/home/data/model/celebrity_model.dart';
import 'package:auto/features/home/domain/entity/celebrity_entity.dart';

extension CelebrityMapper on CelebrityModel {
  CelebrityEntity toEntity() {
    return CelebrityEntity(
      name: name,
      netWorth: netWorth,
      gender: gender,
      nationality: nationality,
      occupation: occupation,
      height: height,
      birthday: birthday,
    );
  }
}