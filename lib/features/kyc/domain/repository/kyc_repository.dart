import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/features/kyc/domain/entity/kyc_submit_response_entity.dart';
import 'package:rentverse/features/kyc/domain/entity/submit_kyc_params.dart';

abstract class KycRepository {
  Future<DataState<KycSubmitResponseEntity>> submitKyc(SubmitKycParams params);
}
