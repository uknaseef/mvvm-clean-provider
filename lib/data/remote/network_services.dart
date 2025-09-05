import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:either_dart/either.dart';
import 'package:mvvm_clean_provider/res/constants/app_constants.dart';
import '../../utils/helpers/common_functions.dart';
import 'network_base_services.dart';

class NetworkServices extends NetWorkBaseServices {
  static const kConnectTimeOut = Duration(milliseconds: 60000);
  static const kReceiveTimeOut = Duration(milliseconds: 60000);

  @override
  Either<ResponseError, BaseResponse> checkHttpStatus(BaseResponse response) {
    return getStatus(response);
  }

  var logger = Logger(
    printer: PrettyPrinter(methodCount: 0, colors: true),
    level: Level.debug,
    output: ConsoleOutput(),
  );

  @override
  Future<BaseResponse> getRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available');
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"},
      ),
    );

    try {
      logger.w(
        '🌐 GET Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      );

      Response response = await dio
          .get(endPoint, data: parameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out');
              throw ApiExceptions.oops();
            },
          );

      logger.i('✅ Response Received - Status: ${response.statusCode}');
      log('📋 Response Data: ${response.data}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data: ${error.response?.data}');
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> postRequest({
    required String endPoint,
    Map<String, dynamic>? parameters,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Connection');
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "application/json"},
      ),
    );

    try {
      logger.w(
        '🌐 POST Request Initiated',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Body: $parameters',
        stackTrace: StackTrace.empty,
        time: null,
      );

      Response response = await dio
          .post(endPoint, data: parameters)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out');
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data: ${response.data}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data: ${error.response?.data}');
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      throw ApiExceptions.oops();
    }
  }

  @override
  Future<BaseResponse> multiPartRequest({
    required String endPoint,
    required FormData formFields,
    bool isFromAuth = false,
  }) async {
    if (!(await isInternetAvailable())) {
      logger.w('⚠ No Internet Available');
      throw ApiExceptions.noInternet();
    }

    final dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );

    try {
      logger.w('🌐 Multipart Request Initiated');
      logger.d(
        '🔗 URL: ${dio.options.baseUrl}$endPoint',
        stackTrace: StackTrace.empty,
        time: null,
      );
      logger.d(
        '📦 Form Data: ${formFields.fields}',
        stackTrace: StackTrace.empty,
        time: null,
      );

      Response response = await dio
          .post(endPoint, data: formFields)
          .timeout(
            kReceiveTimeOut,
            onTimeout: () {
              logger.e('⏳ Request Timed Out');
              throw ApiExceptions.oops();
            },
          );

      logger.i(
        '✅ Response Received - Status: ${response.statusCode}',
        stackTrace: StackTrace.empty,
      );
      log('📋 Response Data: ${response.data}');

      return BaseResponse(statusCode: response.statusCode, data: response.data);
    } on DioException catch (error) {
      logger.e('❌ Dio Error - Status: ${error.response?.statusCode}');
      logger.e('📉 Error Data: ${error.response?.data}');
      return BaseResponse(
        statusCode: error.response?.statusCode,
        data: error.response?.data,
      );
    } catch (e) {
      logger.e('💥 Unexpected Error: $e');
      throw ApiExceptions.oops();
    }
  }

  @override
  Either<ResponseError, BaseResponse> getStatus(BaseResponse response) {
    switch (response.statusCode) {
      case 200:
        return Right(response);
      case 400:
        return Right(response);
      case 401:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data,
          ),
        );
      case 403:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data,
          ),
        );
      case 404:
        return Left(
          ResponseError(
            key: ApiErrorTypes.notFound,
            message: "Not Found",
            response: response.data,
          ),
        );
      case 422:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unAuthorized,
            message: "UnAuthorized",
            response: response.data,
          ),
        );
      case 500:
        return Left(
          ResponseError(
            key: ApiErrorTypes.internalServerError,
            message: "Internal Server Error",
            response: response.data,
          ),
        );
      case 503:
        return Left(
          ResponseError(
            key: ApiErrorTypes.serviceUnavailable,
            message: "Service Unavailable",
            response: response.data,
          ),
        );
      default:
        return Left(
          ResponseError(
            key: ApiErrorTypes.unknown,
            message: "Unknown",
            response: response.data,
          ),
        );
    }
  }

  @override
  Future<Either<ResponseError, dynamic>> parseJson(
    BaseResponse response,
  ) async {
    try {
      return Right(response.data);
    } catch (e) {
      return const Left(
        ResponseError(
          key: ApiErrorTypes.jsonParsing,
          message: "Failed on json Parsing",
        ),
      );
    }
  }

  @override
  Future<Either<ResponseError, BaseResponse>> safe(
    Future<BaseResponse> request,
  ) async {
    try {
      return Right(await request);
    } on ApiExceptions catch (error) {
      return Left(
        ResponseError(
          key: error.errorType,
          message: error.message,
          response: error.response,
        ),
      );
    } catch (e) {
      return Left(
        ResponseError(
          key: ApiErrorTypes.unknown,
          message: "Unknown Error : $e",
        ),
      );
    }
  }
}
