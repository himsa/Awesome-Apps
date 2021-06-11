import '../entity/photos_model.dart';

abstract class IHomeRepository {
  Future<Photos> getPhotos();
}
