import 'package:otp_project/models/response_model.dart';

abstract class VerifyDatasourceAbstractClass {
  Future<ResponseModel> sendEmailToVerify({required String email, required String name});
  Future<ResponseModel> verifyTokenReceived({required String email, required String token});
}