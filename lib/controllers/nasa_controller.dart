import 'package:api_nasa/models/movie_model.dart';
import 'package:flutter/cupertino.dart';

import '../repositories/nasa_repository.dart';

class NasaController {
  final NasaRepository _nasaRepository;
  NasaController(this._nasaRepository);

  ValueNotifier<PictureoftheDayModel?> pictures = ValueNotifier<PictureoftheDayModel?>(null);
  fetch() async {
    PictureoftheDayModel result = await _nasaRepository.getPictureoftheDay();
    pictures.value = result;
    
  }
}
