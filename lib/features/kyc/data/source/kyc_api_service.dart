import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rentverse/core/network/dio_client.dart';
import 'package:rentverse/core/network/response/base_response_model.dart';
import 'package:rentverse/features/kyc/data/models/kyc_submit_response_model.dart';

abstract class KycApiService {
  Future<BaseResponseModel<KycSubmitResponseModel>> submitKyc({
    required File ktpImage,
    required File selfieImage,
  });
}

class KycApiServiceImpl implements KycApiService {
  final DioClient _dioClient;

  KycApiServiceImpl(this._dioClient);

  @override
  Future<BaseResponseModel<KycSubmitResponseModel>> submitKyc({
    required File ktpImage,
    required File selfieImage,
  }) async {
    try {
      final formData = FormData.fromMap({
        'ktp': await MultipartFile.fromFile(ktpImage.path),
        'selfie': await MultipartFile.fromFile(selfieImage.path),
      });

      final response = await _dioClient.post(
        '/kyc/submit',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return BaseResponseModel.fromJson(
        response.data as Map<String, dynamic>,
        (json) => KycSubmitResponseModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      rethrow;
    }
  }
}
