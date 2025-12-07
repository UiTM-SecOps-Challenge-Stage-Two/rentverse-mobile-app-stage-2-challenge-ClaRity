import 'package:rentverse/core/resources/data_state.dart';
import 'package:rentverse/core/usecase/usecase.dart';
import 'package:rentverse/features/auth/domain/entity/update_profile_request_entity.dart';
import 'package:rentverse/features/auth/domain/entity/user_entity.dart';
import 'package:rentverse/features/auth/domain/repository/auth_repository.dart';

class UpdateProfileUseCase
    implements UseCase<DataState<UserEntity>, UpdateProfileRequestEntity> {
  final AuthRepository _authRepository;

  UpdateProfileUseCase(this._authRepository);

  @override
  Future<DataState<UserEntity>> call({UpdateProfileRequestEntity? param}) {
    if (param == null) {
      throw const FormatException('Update profile params tidak boleh null');
    }
    return _authRepository.updateProfile(param);
  }
}
