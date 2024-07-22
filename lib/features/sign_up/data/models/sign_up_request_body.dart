import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';
@JsonSerializable()
class SignUpRequestBody {
  String name;
  String email;
  String phone;
  int gender;
  String password;
  @JsonKey(name: 'password_confirmation')
  String passwordConfirmation;

  SignUpRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.password,
    required this.passwordConfirmation,
    });

    Map<String,dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
