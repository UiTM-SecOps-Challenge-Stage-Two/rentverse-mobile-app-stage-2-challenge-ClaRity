import 'package:dio/dio.dart';
import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/features/kyc/data/source/kyc_api_service.dart';
import 'package:rentverse/features/kyc/domain/entity/submit_kyc_params.dart';
import 'package:rentverse/features/kyc/domain/entity/kyc_submit_response_entity.dart';
import 'package:rentverse/features/kyc/domain/repository/kyc_repository.dart';

class KycRepositoryImpl implements KycRepository {
  final KycApiService _apiService;

  KycRepositoryImpl(this._apiService);

  @override
  Future<DataState<KycSubmitResponseEntity>> submitKyc(
    SubmitKycParams params,
  ) async {
    try {
      final httpResponse = await _apiService.submitKyc(
        ktpImage: params.ktpImage,
        selfieImage: params.selfieImage,
      );

      if (httpResponse.data != null) {
        return DataSuccess(data: httpResponse.data!);
      }

      return DataFailed(
        DioException(
          requestOptions: RequestOptions(path: '/kyc/submit'),
          error: httpResponse.message ?? 'Submit KYC failed',
          type: DioExceptionType.badResponse,
        ),
      );
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
