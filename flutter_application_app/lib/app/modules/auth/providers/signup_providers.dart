import 'package:get/get.dart'; 
import 'package:get_storage/get_storage.dart';


import '../../../shared/constants.dart';
import '../models/signup_request_model.dart';
import '../models/signup_respons_model.dart'; 

class SignupProvider extends GetConnect { 
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
      if (map is Map<String, dynamic>) return SignuprequestModel.fromJson(map); 
      if (map is List) return map.map((item) => SignuprequestModel.fromJson(item)).toList(); 
    }; 
    httpClient.baseUrl = Constants.baseUrl; 
  } 
 
  // Future<SignupRequestModel?> getSignup(int id) async { 
  //   final response = await get('signup/$id'); 
  //   return response.body; 
  // } 
 
  Future<Response<SignupResponsModel>> postSignup(SignuprequestModel signup) async => 
      await post('signup', signup.toJson(), contentType: _contentType, decoder: (data) { 
        return SignupResponsModel.fromJson(data); 
      }); 
 
  // Future<Response> deleteSignup(int id) async => await delete('signup/$id'); 
}