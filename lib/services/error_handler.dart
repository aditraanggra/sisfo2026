import '/backend/api_requests/api_manager.dart';

/// Enum representing the type of error that occurred.
enum ErrorType {
  /// Network-related errors (no connection, timeout)
  network,

  /// Validation errors (invalid input data)
  validation,

  /// Authentication errors (unauthorized, session expired)
  authentication,

  /// Server-side errors (500, 502, 503, etc.)
  server,

  /// Unknown or unclassified errors
  unknown,
}

/// Represents an application error with user-friendly messaging.
///
/// All error messages are in Bahasa Indonesia as per Requirements 10.1, 10.2.
class AppError {
  /// Error code for identification and logging
  final String code;

  /// User-friendly error message in Bahasa Indonesia
  final String userMessage;

  /// Technical error message for debugging/logging (not shown to users)
  final String? technicalMessage;

  /// Type of error for categorization
  final ErrorType type;

  /// Whether this error can be retried
  final bool isRetryable;

  /// Guidance message for the user on how to resolve the issue
  final String? guidance;

  const AppError({
    required this.code,
    required this.userMessage,
    this.technicalMessage,
    required this.type,
    required this.isRetryable,
    this.guidance,
  });

  /// Creates a network error (no internet connection)
  factory AppError.networkError() {
    return const AppError(
      code: 'NO_CONNECTION',
      userMessage: 'Tidak ada koneksi internet.',
      type: ErrorType.network,
      isRetryable: true,
      guidance: 'Periksa koneksi internet Anda dan coba lagi.',
    );
  }

  /// Creates a timeout error
  factory AppError.timeoutError() {
    return const AppError(
      code: 'TIMEOUT',
      userMessage: 'Koneksi timeout.',
      type: ErrorType.network,
      isRetryable: true,
      guidance:
          'Server membutuhkan waktu lebih lama untuk merespons. Silakan coba lagi.',
    );
  }

  /// Creates a session expired error
  factory AppError.sessionExpired() {
    return const AppError(
      code: 'SESSION_EXPIRED',
      userMessage: 'Sesi Anda telah berakhir.',
      type: ErrorType.authentication,
      isRetryable: false,
      guidance: 'Silakan login kembali untuk melanjutkan.',
    );
  }

  /// Creates an unauthorized error
  factory AppError.unauthorized() {
    return const AppError(
      code: 'UNAUTHORIZED',
      userMessage: 'Anda tidak memiliki akses.',
      type: ErrorType.authentication,
      isRetryable: false,
      guidance: 'Silakan login dengan akun yang memiliki akses.',
    );
  }

  /// Creates a forbidden error
  factory AppError.forbidden() {
    return const AppError(
      code: 'FORBIDDEN',
      userMessage: 'Anda tidak memiliki izin untuk melakukan aksi ini.',
      type: ErrorType.authentication,
      isRetryable: false,
      guidance: 'Hubungi administrator jika Anda memerlukan akses.',
    );
  }

  /// Creates a not found error
  factory AppError.notFound({String? itemName}) {
    return AppError(
      code: 'NOT_FOUND',
      userMessage: itemName != null
          ? '$itemName tidak ditemukan.'
          : 'Data tidak ditemukan.',
      type: ErrorType.validation,
      isRetryable: false,
      guidance: 'Pastikan data yang Anda cari masih tersedia.',
    );
  }

  /// Creates a validation error
  factory AppError.validationError({String? message}) {
    return AppError(
      code: 'VALIDATION_ERROR',
      userMessage: message ?? 'Data tidak valid.',
      type: ErrorType.validation,
      isRetryable: false,
      guidance:
          'Periksa kembali input Anda dan pastikan semua data terisi dengan benar.',
    );
  }

  /// Creates a server error
  factory AppError.serverError() {
    return const AppError(
      code: 'SERVER_ERROR',
      userMessage: 'Terjadi kesalahan pada server.',
      type: ErrorType.server,
      isRetryable: true,
      guidance: 'Silakan coba beberapa saat lagi.',
    );
  }

  /// Creates a service unavailable error
  factory AppError.serviceUnavailable() {
    return const AppError(
      code: 'SERVICE_UNAVAILABLE',
      userMessage: 'Layanan sedang tidak tersedia.',
      type: ErrorType.server,
      isRetryable: true,
      guidance:
          'Server sedang dalam pemeliharaan. Silakan coba beberapa saat lagi.',
    );
  }

  /// Creates an unknown error
  factory AppError.unknown({String? technicalMessage}) {
    return AppError(
      code: 'UNKNOWN',
      userMessage: 'Terjadi kesalahan.',
      technicalMessage: technicalMessage,
      type: ErrorType.unknown,
      isRetryable: true,
      guidance:
          'Silakan coba lagi atau hubungi administrator jika masalah berlanjut.',
    );
  }

  /// Creates an error from API response
  factory AppError.fromApiResponse(ApiCallResponse response) {
    return ErrorHandler.handleApiResponse(response);
  }

  /// Returns the full user message including guidance
  String get fullMessage {
    if (guidance != null && guidance!.isNotEmpty) {
      return '$userMessage $guidance';
    }
    return userMessage;
  }

  @override
  String toString() {
    return 'AppError(code: $code, message: $userMessage, type: $type, isRetryable: $isRetryable)';
  }
}

/// ErrorHandler provides centralized error handling for the application.
///
/// Maps API errors and exceptions to user-friendly Indonesian messages.
/// Requirements: 10.1, 10.2, 10.3
class ErrorHandler {
  /// Private constructor to prevent instantiation
  ErrorHandler._();

  /// Handles an API response and returns an appropriate AppError if failed.
  /// Returns null if the response was successful.
  static AppError? handleApiResponseIfError(ApiCallResponse response) {
    if (response.succeeded) {
      return null;
    }
    return handleApiResponse(response);
  }

  /// Handles an API response and returns an appropriate AppError.
  static AppError handleApiResponse(ApiCallResponse response) {
    final statusCode = response.statusCode;
    final jsonBody = response.jsonBody;

    // Handle exception cases (e.g., network errors)
    if (response.exception != null) {
      return handleException(response.exception!);
    }

    // Handle based on status code
    switch (statusCode) {
      case -1:
        // Network error or exception occurred
        return AppError.networkError();

      case 400:
        // Bad request - validation error
        final message = _extractErrorMessage(jsonBody);
        return AppError.validationError(message: message);

      case 401:
        // Unauthorized - session expired or invalid token
        return AppError.sessionExpired();

      case 403:
        // Forbidden - no permission
        return AppError.forbidden();

      case 404:
        // Not found
        return AppError.notFound();

      case 408:
        // Request timeout
        return AppError.timeoutError();

      case 422:
        // Unprocessable entity - validation error
        final message = _extractValidationErrors(jsonBody);
        return AppError.validationError(message: message);

      case 429:
        // Too many requests
        return const AppError(
          code: 'RATE_LIMITED',
          userMessage: 'Terlalu banyak permintaan.',
          type: ErrorType.server,
          isRetryable: true,
          guidance: 'Silakan tunggu beberapa saat sebelum mencoba lagi.',
        );

      case 500:
        // Internal server error
        return AppError.serverError();

      case 502:
        // Bad gateway
        return AppError.serverError();

      case 503:
        // Service unavailable
        return AppError.serviceUnavailable();

      case 504:
        // Gateway timeout
        return AppError.timeoutError();

      default:
        if (statusCode >= 500) {
          return AppError.serverError();
        } else if (statusCode >= 400) {
          final message = _extractErrorMessage(jsonBody);
          return AppError(
            code: 'CLIENT_ERROR',
            userMessage: message ?? 'Terjadi kesalahan pada permintaan.',
            type: ErrorType.validation,
            isRetryable: false,
            guidance: 'Periksa kembali data yang Anda masukkan.',
          );
        }
        return AppError.unknown(
          technicalMessage: 'Status code: $statusCode',
        );
    }
  }

  /// Handles a generic exception and returns an appropriate AppError.
  static AppError handleException(Object exception) {
    final exceptionString = exception.toString().toLowerCase();

    // Check for common network-related exceptions
    if (exceptionString.contains('socketexception') ||
        exceptionString.contains('connection refused') ||
        exceptionString.contains('network is unreachable') ||
        exceptionString.contains('no route to host') ||
        exceptionString.contains('connection reset')) {
      return AppError.networkError();
    }

    if (exceptionString.contains('timeout') ||
        exceptionString.contains('timed out')) {
      return AppError.timeoutError();
    }

    if (exceptionString.contains('handshake') ||
        exceptionString.contains('certificate') ||
        exceptionString.contains('ssl') ||
        exceptionString.contains('tls')) {
      return const AppError(
        code: 'SSL_ERROR',
        userMessage: 'Terjadi kesalahan keamanan koneksi.',
        type: ErrorType.network,
        isRetryable: true,
        guidance: 'Pastikan tanggal dan waktu perangkat Anda sudah benar.',
      );
    }

    if (exceptionString.contains('formatexception') ||
        exceptionString.contains('json')) {
      return const AppError(
        code: 'PARSE_ERROR',
        userMessage: 'Terjadi kesalahan saat memproses data.',
        type: ErrorType.server,
        isRetryable: true,
        guidance: 'Silakan coba lagi.',
      );
    }

    // Default to unknown error
    return AppError.unknown(technicalMessage: exception.toString());
  }

  /// Extracts error message from API response body.
  static String? _extractErrorMessage(dynamic jsonBody) {
    if (jsonBody == null) return null;

    if (jsonBody is Map) {
      // Try common error message fields
      final message = jsonBody['message'] ??
          jsonBody['error'] ??
          jsonBody['error_message'] ??
          jsonBody['msg'];

      if (message is String && message.isNotEmpty) {
        return _translateCommonErrors(message);
      }

      // Check for nested error object
      if (jsonBody['error'] is Map) {
        final errorMap = jsonBody['error'] as Map;
        final nestedMessage = errorMap['message'] ?? errorMap['msg'];
        if (nestedMessage is String && nestedMessage.isNotEmpty) {
          return _translateCommonErrors(nestedMessage);
        }
      }
    }

    return null;
  }

  /// Extracts validation errors from API response (typically 422 responses).
  static String? _extractValidationErrors(dynamic jsonBody) {
    if (jsonBody == null) return null;

    if (jsonBody is Map) {
      // Check for Laravel-style validation errors
      final errors = jsonBody['errors'];
      if (errors is Map && errors.isNotEmpty) {
        final errorMessages = <String>[];
        errors.forEach((field, messages) {
          if (messages is List && messages.isNotEmpty) {
            errorMessages.add(messages.first.toString());
          } else if (messages is String) {
            errorMessages.add(messages);
          }
        });
        if (errorMessages.isNotEmpty) {
          return errorMessages.join(' ');
        }
      }

      // Fall back to regular message extraction
      return _extractErrorMessage(jsonBody);
    }

    return null;
  }

  /// Translates common English error messages to Indonesian.
  static String _translateCommonErrors(String message) {
    final lowerMessage = message.toLowerCase();

    // Common authentication errors
    if (lowerMessage.contains('invalid credentials') ||
        lowerMessage.contains('wrong password') ||
        lowerMessage.contains('incorrect password')) {
      return 'Email atau password salah.';
    }

    if (lowerMessage.contains('user not found') ||
        lowerMessage.contains('email not found')) {
      return 'Akun tidak ditemukan.';
    }

    if (lowerMessage.contains('email already exists') ||
        lowerMessage.contains('email has already been taken')) {
      return 'Email sudah terdaftar.';
    }

    if (lowerMessage.contains('token expired') ||
        lowerMessage.contains('session expired')) {
      return 'Sesi Anda telah berakhir. Silakan login kembali.';
    }

    if (lowerMessage.contains('unauthenticated')) {
      return 'Anda belum login. Silakan login terlebih dahulu.';
    }

    // Common validation errors
    if (lowerMessage.contains('required')) {
      return 'Semua field wajib harus diisi.';
    }

    if (lowerMessage.contains('invalid email') ||
        lowerMessage.contains('email format')) {
      return 'Format email tidak valid.';
    }

    if (lowerMessage.contains('password') && lowerMessage.contains('min')) {
      return 'Password minimal 8 karakter.';
    }

    if (lowerMessage.contains('password') &&
        lowerMessage.contains('confirmation')) {
      return 'Konfirmasi password tidak cocok.';
    }

    // Common data errors
    if (lowerMessage.contains('not found')) {
      return 'Data tidak ditemukan.';
    }

    if (lowerMessage.contains('already exists') ||
        lowerMessage.contains('duplicate')) {
      return 'Data sudah ada.';
    }

    if (lowerMessage.contains('cannot delete') ||
        lowerMessage.contains('cannot be deleted')) {
      return 'Data tidak dapat dihapus.';
    }

    // Server errors
    if (lowerMessage.contains('internal server error')) {
      return 'Terjadi kesalahan pada server.';
    }

    if (lowerMessage.contains('service unavailable')) {
      return 'Layanan sedang tidak tersedia.';
    }

    // Return original message if no translation found
    // (it might already be in Indonesian from the API)
    return message;
  }

  /// Determines if an error is retryable based on its type.
  static bool isRetryable(AppError error) {
    return error.isRetryable;
  }

  /// Determines if an error is retryable based on status code.
  static bool isRetryableStatusCode(int statusCode) {
    // Network errors
    if (statusCode == -1) return true;

    // Timeout errors
    if (statusCode == 408 || statusCode == 504) return true;

    // Server errors (might be temporary)
    if (statusCode >= 500 && statusCode < 600) return true;

    // Rate limiting
    if (statusCode == 429) return true;

    return false;
  }

  /// Determines if an error requires re-authentication.
  static bool requiresReauth(AppError error) {
    return error.type == ErrorType.authentication &&
        (error.code == 'SESSION_EXPIRED' || error.code == 'UNAUTHORIZED');
  }

  /// Gets a user-friendly error message from an API response.
  /// Convenience method for quick error message extraction.
  static String getErrorMessage(ApiCallResponse response) {
    final error = handleApiResponse(response);
    return error.fullMessage;
  }

  /// Gets a short error message (without guidance) from an API response.
  static String getShortErrorMessage(ApiCallResponse response) {
    final error = handleApiResponse(response);
    return error.userMessage;
  }
}
