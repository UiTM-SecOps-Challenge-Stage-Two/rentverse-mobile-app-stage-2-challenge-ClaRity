import 'dart:io';

enum VerifyIKycStep { ktp, selfie, review, success }

class VerifyIKycState {
  final VerifyIKycStep step;
  final File? ktpImage;
  final File? selfieImage;
  final bool isSubmitting;
  final String? error;
  final String? successMessage;

  const VerifyIKycState({
    required this.step,
    this.ktpImage,
    this.selfieImage,
    required this.isSubmitting,
    this.error,
    this.successMessage,
  });

  factory VerifyIKycState.initial() => const VerifyIKycState(
    step: VerifyIKycStep.ktp,
    ktpImage: null,
    selfieImage: null,
    isSubmitting: false,
    error: null,
    successMessage: null,
  );

  VerifyIKycState copyWith({
    VerifyIKycStep? step,
    File? ktpImage,
    File? selfieImage,
    bool? isSubmitting,
    String? error,
    String? successMessage,
    bool resetError = false,
    bool resetMessage = false,
  }) {
    return VerifyIKycState(
      step: step ?? this.step,
      ktpImage: ktpImage ?? this.ktpImage,
      selfieImage: selfieImage ?? this.selfieImage,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      error: resetError ? null : error ?? this.error,
      successMessage: resetMessage
          ? null
          : successMessage ?? this.successMessage,
    );
  }

  bool get canSubmit => ktpImage != null && selfieImage != null;
}
