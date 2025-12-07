import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/features/kyc/domain/entity/submit_kyc_params.dart';
import 'package:rentverse/features/kyc/domain/usecase/submit_kyc_usecase.dart';
import 'verify_ikyc_state.dart';

class VerifyIKycCubit extends Cubit<VerifyIKycState> {
  VerifyIKycCubit(this._submitKycUseCase) : super(VerifyIKycState.initial());

  final SubmitKycUseCase _submitKycUseCase;

  void setKtpImage(File file) {
    emit(
      state.copyWith(
        ktpImage: file,
        step: VerifyIKycStep.selfie,
        resetError: true,
        resetMessage: true,
      ),
    );
  }

  void setSelfieImage(File file) {
    emit(
      state.copyWith(
        selfieImage: file,
        step: VerifyIKycStep.review,
        resetError: true,
        resetMessage: true,
      ),
    );
  }

  void goToStep(VerifyIKycStep step) {
    emit(state.copyWith(step: step, resetError: true, resetMessage: true));
  }

  Future<void> submit() async {
    if (state.ktpImage == null || state.selfieImage == null) {
      emit(
        state.copyWith(
          error: 'KTP dan selfie wajib diunggah',
          resetMessage: true,
        ),
      );
      return;
    }

    emit(
      state.copyWith(isSubmitting: true, resetError: true, resetMessage: true),
    );

    final result = await _submitKycUseCase(
      param: SubmitKycParams(
        ktpImage: state.ktpImage!,
        selfieImage: state.selfieImage!,
      ),
    );

    if (result is DataSuccess) {
      emit(
        state.copyWith(
          isSubmitting: false,
          successMessage: result.data?.message ?? 'KYC berhasil dikirim',
          step: VerifyIKycStep.success,
        ),
      );
    } else if (result is DataFailed) {
      emit(
        state.copyWith(
          isSubmitting: false,
          error: result.error?.message ?? 'Gagal mengirim KYC',
        ),
      );
    } else {
      emit(state.copyWith(isSubmitting: false, error: 'Gagal mengirim KYC'));
    }
  }
}
