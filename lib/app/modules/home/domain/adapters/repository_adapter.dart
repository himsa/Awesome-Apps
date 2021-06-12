import '../entity/pagination_filter.dart';

import '../entity/photos_model.dart';

abstract class IHomeRepository {
  Future<Photos> getPhotos(PaginationFilter paginationFilter);
}
