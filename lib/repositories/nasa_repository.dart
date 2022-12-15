import '../models/movie_model.dart';

abstract class NasaRepository {
  Future<PictureoftheDayModel> getPictureoftheDay();
}
