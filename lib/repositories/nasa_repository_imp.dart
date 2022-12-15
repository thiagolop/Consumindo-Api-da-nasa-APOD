import 'dart:developer';

import 'package:api_nasa/models/movie_model.dart';
import 'package:api_nasa/service/dio_service.dart';
import 'package:api_nasa/utils/api_utis.dart';
import 'nasa_repository.dart';

class NasaRepositoryImp implements NasaRepository {
  final DioService _dioService;
  NasaRepositoryImp(this._dioService);

  @override
  Future<PictureoftheDayModel> getPictureoftheDay() async {
    try {
      var result = await _dioService.getDio().get(ApiUtis.AstronomyPictureoftheDay);
      return PictureoftheDayModel.fromJson(result.data);
    } on Exception catch (e) {
      log('erro $e');
      rethrow;
    }
  }
}
