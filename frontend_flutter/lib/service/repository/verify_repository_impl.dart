import 'package:dio/dio.dart';
import 'package:otp_project/models/response_model.dart';
import 'package:otp_project/service/datasource/verify_datasource_abstract_class.dart';

class VerifyRepositoryImpl extends VerifyDatasourceAbstractClass {

  final dio = Dio(BaseOptions(
    baseUrl: 'http://xxxxx.xxxxx.xxx/', //Reemplaza por la ip de tu servidor
    )
  );

  @override
  Future<ResponseModel> sendEmailToVerify({required String email, required String name}) async {
    try {
        final response = await dio.post("confirm",
          data: {
            "email": email,
            "name": name
          }
      );
      final responseModel = ResponseModel.fromJson(response.data);
      return responseModel;
    } on DioException catch(e) {
      if (e.response != null && e.response!.statusCode == 404) {
        const responseModel = ResponseModel(
          success: false,
          msg: "No se encontró el recurso"
        );
        return responseModel;
      } else if (e.response != null && e.response!.statusCode == 403) {
          final responseModel = ResponseModel.fromJson(e.response!.data);
          return responseModel;
      } else if (e.response != null && e.response!.statusCode == 500) {
          const responseModel = ResponseModel(
            success: false,
            msg: "No se pudo conectar con el servidor"
          );
          return responseModel;
      } else {
          const responseModel = ResponseModel(
            success: false,
            msg: "Ocurrió un error desconocido, por favor intente nuevamente más tarde"
          );
          return responseModel;
      }
    }
  }

  @override
  Future<ResponseModel> verifyTokenReceived({required String email, required String token}) async {
    try {
      final response = await dio.post("verifyToken", 
        data: {
          "email": email,
          "token": token 
        }
      );
      final responseModel = ResponseModel.fromJson(response.data);
      return responseModel;
    } on DioException catch(e) {
      if (e.response != null && e.response!.statusCode == 404) {
        const responseModel = ResponseModel(
          success: false,
          msg: "No se encontró el recurso"
        );
        return responseModel;
      } else if (e.response != null && e.response!.statusCode == 403) {
          final responseModel = ResponseModel.fromJson(e.response!.data);
          return responseModel;
      } else if (e.response != null && e.response!.statusCode == 500) {
          const responseModel = ResponseModel(
            success: false,
            msg: "No se pudo conectar con el servidor"
          );
          return responseModel;
      } else {
          const responseModel = ResponseModel(
            success: false,
            msg: "Ocurrió un error desconocido, por favor intente nuevamente más tarde"
          );
          return responseModel;
      }
    }
  }
}