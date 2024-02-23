import 'package:get/get.dart';

import '../models/model_model.dart';

class ModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Model.fromJson(map);
      if (map is List) return map.map((item) => Model.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Model?> getModel(int id) async {
    final response = await get('model/$id');
    return response.body;
  }

  Future<Response<Model>> postModel(Model model) async =>
      await post('model', model);
  Future<Response> deleteModel(int id) async => await delete('model/$id');
}
