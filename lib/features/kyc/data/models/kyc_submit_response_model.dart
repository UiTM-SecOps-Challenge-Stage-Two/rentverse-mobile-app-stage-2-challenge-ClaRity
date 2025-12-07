import 'package:rentverse/features/kyc/domain/entity/kyc_submit_response_entity.dart';

class KycSubmitResponseModel extends KycSubmitResponseEntity {
  const KycSubmitResponseModel({String? message}) : super(message: message);

  factory KycSubmitResponseModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    final message = data != null
        ? data['message'] as String?
        : json['message'] as String?;
    return KycSubmitResponseModel(message: message);
  }
}
