import 'dart:io';
import 'dart:async';

import 'package:dr_scan_graduation_project/utils/strings/error_messages.dart';

class Failure {
  final String message;

  Failure(this.message);

  factory Failure.fromException(dynamic error) {
    const defaultErrorMessage = UNKNOWN_ERROR;
    final errorMessages = {
      SocketException: NETWORK_ERROR,
      TimeoutException: TIMEOUT_ERROR,
      FormatException: INVALID_RESPONSE_FORMAT,
      HttpException: SERVER_ERROR,
      HandshakeException: SERVER_ERROR,
    };

    final String errorMessage =
        errorMessages[error.runtimeType] ?? defaultErrorMessage;
    return Failure(errorMessage);
  }
}
