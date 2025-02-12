import 'package:flutter/material.dart';
import '../../domain/use_case/home_use_case.dart';
import '../../domain/entity/celebrity_entity.dart';

class HomeController extends ChangeNotifier {
  final HomeUseCase _useCase;
  List<CelebrityEntity>? allCelebrities;
  List<CelebrityEntity>? filteredCelebrities;
  String? errorMessage;

  HomeController(this._useCase);

  Future<void> init() async {
    try {
      allCelebrities = await _useCase();
      filteredCelebrities = allCelebrities;
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void filterCelebrities(String name) {
    if (name.isEmpty) {
      filteredCelebrities = allCelebrities;
    } else {
      filteredCelebrities = allCelebrities?.where((celebrity) {
        return celebrity.name.toLowerCase().contains(name.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}