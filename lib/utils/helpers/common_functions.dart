import 'dart:io';
import 'package:flutter/material.dart';
import '../../data/remote/network_base_services.dart';
import '../../res/enums/enums.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}

LoaderState handleResponseError(ApiErrorTypes errorType) {
  return switch (errorType) {
    ApiErrorTypes.cancel => LoaderState.error,
    ApiErrorTypes.noInternet => LoaderState.networkError,
    ApiErrorTypes.badCertificate => LoaderState.error,
    ApiErrorTypes.badResponse => LoaderState.error,
    ApiErrorTypes.connectionError => LoaderState.error,
    ApiErrorTypes.connectionTimeout => LoaderState.error,
    ApiErrorTypes.badRequest => LoaderState.error,
    ApiErrorTypes.jsonParsing => LoaderState.error,
    ApiErrorTypes.internalServerError => LoaderState.serverError,
    ApiErrorTypes.sendTimeout => LoaderState.error,
    ApiErrorTypes.notFound => LoaderState.error,
    ApiErrorTypes.oops => LoaderState.error,
    ApiErrorTypes.unAuthorized => LoaderState.error,
    ApiErrorTypes.serviceUnavailable => LoaderState.error,
    ApiErrorTypes.receiveTimeout => LoaderState.error,
    _ => LoaderState.error,
  };
}

void showCustomToast({
  required String message,
  bool? isSuccess,
  Duration? duration,
  String? link,
  VoidCallback? onTap,
  bool? increaseBottomPadding,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: duration?.inSeconds ?? 3,
    backgroundColor: isSuccess == true ? Colors.green : Colors.red,
    fontSize: 16.0,
  );
}
