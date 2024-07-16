import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_body.g.dart';

@JsonSerializable()
class LoginRequestBody {
  String email;
  String password;

  LoginRequestBody({required this.email,required this.password});

  /*ana 5alito y3mel auto generate 3lshan ana m3mlsh el toJson b idy zy kda:
    Map<String, dynamic> toJson() => {
      'email': email,
      'password': password
    }; */

  Map<String, dynamic> toJson() => _$LoginRequestBodyToJson(this);
}
