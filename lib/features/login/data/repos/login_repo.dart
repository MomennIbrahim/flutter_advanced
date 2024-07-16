import 'package:advanced_app/core/networking/api_error_handler.dart';
import 'package:advanced_app/core/networking/api_result.dart';
import 'package:advanced_app/core/networking/api_service.dart';
import 'package:advanced_app/features/login/data/models/login_request_body.dart';
import 'package:advanced_app/features/login/data/models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login({
    required LoginRequestBody loginRequestBody,
  }) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.sussess(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
