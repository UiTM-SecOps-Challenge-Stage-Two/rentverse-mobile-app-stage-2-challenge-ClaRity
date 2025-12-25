import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/features/auth/domain/usecase/get_user_usecase.dart';

import 'state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserUseCase _getUserUseCase;

  ProfileCubit(this._getUserUseCase) : super(const ProfileState());

  Future<void> loadProfile() async {
    emit(state.copyWith(status: ProfileStatus.loading));
    try {
      final result = await _getUserUseCase();

      if (result is DataSuccess && result.data != null) {
        emit(state.copyWith(status: ProfileStatus.success, user: result.data));
      } else if (result is DataFailed) {
        final error = result.error;
        int? statusCode;
        String errorMessage = 'Failed to load profile';

        if (error is DioException) {
          statusCode = error.response?.statusCode;
          errorMessage = error.response?.data?['message'] ??
              error.message ??
              'Failed to load profile';
        }

        emit(
          state.copyWith(
            status: ProfileStatus.failure,
            errorMessage: errorMessage,
            statusCode: statusCode,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
