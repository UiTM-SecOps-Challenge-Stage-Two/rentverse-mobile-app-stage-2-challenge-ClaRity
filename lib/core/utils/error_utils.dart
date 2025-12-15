import 'package:dio/dio.dart';

/// Extracts a human-friendly error message from a DioException using common
/// API response shapes. It prefers the backend-provided `message` field and
/// falls back to status text or the exception message.
String resolveApiErrorMessage(
  DioException? error, {
  String fallback = 'Terjadi kesalahan',
}) {
  if (error == null) return fallback;

  final data = error.response?.data;
  if (data is Map) {
    final msg = data['message'] ?? data['error'] ?? data['msg'];
    if (msg is String && msg.trim().isNotEmpty) return msg.trim();
    if (msg is List && msg.isNotEmpty && msg.first is String) {
      final first = (msg.first as String).trim();
      if (first.isNotEmpty) return first;
    }
  } else if (data is String && data.trim().isNotEmpty) {
    return data.trim();
  }

  return error.message ?? error.response?.statusMessage ?? fallback;
}
