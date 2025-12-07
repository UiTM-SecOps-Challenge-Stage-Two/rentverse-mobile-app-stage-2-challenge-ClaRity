import 'package:rentverse/features/auth/domain/entity/user_entity.dart';

class EditProfileState {
  final bool isLoading;
  final bool isSaving;
  final String? error;
  final String? successMessage;
  final UserEntity? user;
  final String nameValue;
  final String emailValue;
  final String phoneValue;
  final bool isEmailVerified;
  final bool isPhoneVerified;
  final String kycStatus;

  const EditProfileState({
    required this.isLoading,
    required this.isSaving,
    this.error,
    this.successMessage,
    this.user,
    required this.nameValue,
    required this.emailValue,
    required this.phoneValue,
    required this.isEmailVerified,
    required this.isPhoneVerified,
    required this.kycStatus,
  });

  factory EditProfileState.initial() => const EditProfileState(
    isLoading: false,
    isSaving: false,
    error: null,
    successMessage: null,
    user: null,
    nameValue: '',
    emailValue: '',
    phoneValue: '',
    isEmailVerified: false,
    isPhoneVerified: false,
    kycStatus: '',
  );

  EditProfileState copyWith({
    bool? isLoading,
    bool? isSaving,
    String? error,
    String? successMessage,
    UserEntity? user,
    String? nameValue,
    String? emailValue,
    String? phoneValue,
    bool? isEmailVerified,
    bool? isPhoneVerified,
    String? kycStatus,
    bool resetMessage = false,
    bool resetError = false,
  }) {
    return EditProfileState(
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      error: resetError ? null : error ?? this.error,
      successMessage: resetMessage
          ? null
          : successMessage ?? this.successMessage,
      user: user ?? this.user,
      nameValue: nameValue ?? this.nameValue,
      emailValue: emailValue ?? this.emailValue,
      phoneValue: phoneValue ?? this.phoneValue,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      kycStatus: kycStatus ?? this.kycStatus,
    );
  }
}
