import 'package:vtqp_flutter_gym_sample/features/membership/domain/entities/membership.dart';

class MembershipModel {
  // 1. Constructores primero
  const MembershipModel({
    required this.type,
    required this.status,
    required this.expirationDate,
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) {
    return MembershipModel(
      type: json['type'] as String,
      status: json['status'] as String,
      expirationDate: json['expirationDate'] as String,
    );
  }

  // 2. Variables después
  final String type;
  final String status;
  final String expirationDate;

  // 3. Métodos al final
  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'status': status,
      'expirationDate': expirationDate,
    };
  }

  Membership toEntity() {
    return Membership(
      type: type,
      status: status,
      expirationDate: expirationDate,
    );
  }
}
