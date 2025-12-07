import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/core/usecase/usecase.dart';
import 'package:rentverse/features/kyc/domain/entity/kyc_submit_response_entity.dart';
import 'package:rentverse/features/kyc/domain/entity/submit_kyc_params.dart';
import 'package:rentverse/features/kyc/domain/repository/kyc_repository.dart';

class SubmitKycUseCase
    implements UseCase<DataState<KycSubmitResponseEntity>, SubmitKycParams> {
  final KycRepository _repo;

  SubmitKycUseCase(this._repo);

  @override
  Future<DataState<KycSubmitResponseEntity>> call({SubmitKycParams? param}) {
    if (param == null) {
      throw const FormatException('SubmitKyc params tidak boleh null');
    }
    return _repo.submitKyc(param);
  }
}
