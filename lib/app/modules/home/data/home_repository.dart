import 'package:awesomeapp/app/modules/home/domain/entity/pagination_filter.dart';

import '../domain/entity/photos_model.dart';

import '../domain/adapters/repository_adapter.dart';

import 'home_api_provider.dart';

class HomeRepository implements IHomeRepository {
  HomeRepository({required this.provider});
  final IHomeProvider provider;

  @override
  Future<Photos> getPhotos(PaginationFilter paginationFilter) async {
    print(
        '/v1/curated?page=${paginationFilter.page}&per_page=${paginationFilter.limit}');
    final photos = await provider.getPhotos(
        "/v1/curated?page=${paginationFilter.page}&per_page=${paginationFilter.limit}");
    if (photos.status.hasError) {
      return Future.error(photos.statusText!);
    } else {
      return photos.body!;
    }
  }
}
