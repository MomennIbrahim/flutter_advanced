import 'package:advanced_app/core/networking/api_constance.dart';
import 'package:advanced_app/features/login/data/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstance.apiBaseUrl)
abstract class ApiService {
// ana hna 3amel inject y3ny eh inject y3ny 5alit el api service class depend on dio
// w el file ely 2t3mli generate dh hwa ely hast5dm feh retrofit m3 dio
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstance.login)
  Future<LoginResponse> login(
    @Body() loginRequestBody,
  );
}
