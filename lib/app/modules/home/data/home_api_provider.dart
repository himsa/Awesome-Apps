import 'package:get/get.dart';
import '../domain/entity/photos_model.dart';

abstract class IHomeProvider {
  Future<Response<Photos>> getPhotos(String path);
}

class HomeProvider extends GetConnect implements IHomeProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => Photos.fromJson(val as Map<String, dynamic>);
    httpClient.baseUrl = 'https://api.pexels.com';
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] =
          '563492ad6f91700001000001d0ad4f4c590e477ebaa87d5652e50c84';
      return request;
    });
  }

  @override
  Future<Response<Photos>> getPhotos(String path) => get(path);
}
