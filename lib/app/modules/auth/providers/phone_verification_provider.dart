import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/models.dart';

class PhoneVerificationProvider extends GetConnect {
  final storage = GetStorage();
  final String _contentType = 'application/json';

  Map<String, String> getHeaders() {
    storage.read('jwt_token');
    Map<String, String> headers = <String, String>{};

    headers.assign('Content-Type', _contentType);

    return headers;
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return VerifyRequestModel.fromJson(map);
      if (map is List)
        return map.map((item) => VerifyRequestModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'https://myblog.mobaen.com/api/';
  }

  Future<VerifyRequestModel?> getVerify(int id) async {
    final response = await get('phone/verify$id');
    return response.body;
  }

  Future<Response<VerifyResponseModel>> postVerify(
        String phone, String code) async {
    final data = {'phone': phone, 'code': code};
    return await post('phone/verify' ,data,
    contentType: _contentType,
      decoder: (data) => VerifyResponseModel.fromJson(data));
      }}
  

  // Future<Response> deleteVerify(int id) async => await delete('phone/verify/$id');
