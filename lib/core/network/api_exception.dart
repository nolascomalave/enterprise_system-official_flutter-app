import 'package:dio/dio.dart';

/// Error de dominio para fallos de la API.
///
/// Normaliza los `DioException` en un mensaje legible para la UI,
/// extrayendo `error`/`message` del envelope del backend Go.
class ApiException implements Exception {
  const ApiException(this.message, {this.statusCode, this.cause});

  final String message;
  final int? statusCode;
  final Object? cause;

  factory ApiException.fromDio(DioException exception) {
    final response = exception.response;
    final data = response?.data;

    String? serverMessage;
    if (data is Map) {
      final raw = data['error'] ?? data['message'];
      if (raw is String && raw.isNotEmpty) {
        serverMessage = raw;
      } else if (raw is Map && raw['message'] is String) {
        serverMessage = raw['message'] as String;
      }
    }

    final fallback = switch (exception.type) {
      DioExceptionType.connectionTimeout => 'Tiempo de conexión agotado.',
      DioExceptionType.receiveTimeout => 'La respuesta del servidor tardó demasiado.',
      DioExceptionType.sendTimeout => 'No se pudo enviar la solicitud.',
      DioExceptionType.connectionError => 'No hay conexión con el servidor.',
      DioExceptionType.cancel => 'Solicitud cancelada.',
      _ => 'Ha ocurrido un error inesperado.',
    };

    return ApiException(
      serverMessage ?? fallback,
      statusCode: response?.statusCode,
      cause: exception,
    );
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
