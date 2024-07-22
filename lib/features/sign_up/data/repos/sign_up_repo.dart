import 'dart:developer';

import 'package:advanced_app/core/networking/api_error_handler.dart';
import 'package:advanced_app/core/networking/api_result.dart';
import 'package:advanced_app/core/networking/api_service.dart';
import 'package:advanced_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:advanced_app/features/sign_up/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<ApiResult<SignUpResponse>> signUp(
      {required SignUpRequestBody signUpRequestBody}) async {
    try {
      final response = await _apiService.register(signUpRequestBody);
      return ApiResult.sussess(response);
    } catch (error) {
      log("from repo ${error.toString()}");
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
