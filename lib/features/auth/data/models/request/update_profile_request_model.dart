import 'package:rentverse/features/auth/domain/entity/update_profile_request_entity.dart';

class UpdateProfileRequestModel extends UpdateProfileRequestEntity {
  const UpdateProfileRequestModel({String? name, String? phone})
    : super(name: name, phone: phone);

  factory UpdateProfileRequestModel.fromEntity(
    UpdateProfileRequestEntity entity,
  ) {
    return UpdateProfileRequestModel(name: entity.name, phone: entity.phone);
  }

  Map<String, dynamic> toJson() {
    return {if (name != null) 'name': name, if (phone != null) 'phone': phone};
  }
}
