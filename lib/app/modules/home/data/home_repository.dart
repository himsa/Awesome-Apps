import '../domain/entity/photos_model.dart';

import '../domain/adapters/repository_adapter.dart';

import 'home_api_provider.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<Photos> getPhotos() async {
    final photos = await provider.getPhotos("/v1/curated?page=1&per_page=10");
    if (photos.status.hasError) {
      return Future.error(photos.statusText!);
    } else {
      return photos.body!;
    }
  }
}
