import 'package:clean_architecture/core/database/api/end_points.dart';
import 'package:clean_architecture/features/user/data/models/sub_models/address_model.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entities/user_entity.dart';

import 'sub_models/company_model.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  final String website;
  final CompanyModel company;

  UserModel({
    required super.name,
    required super.phone,
    required super.email,
    required super.address,
    required this.username,
    required this.website,
    required this.company,
    required this.id,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json[ApiKeys.id],
      name: json[ApiKeys.name],
      phone: json[ApiKeys.phone],
      email: json[ApiKeys.email],
      username: json[ApiKeys.username],
      website: json[ApiKeys.website],
      address: AddressModel.fromJson(json[ApiKeys.address]),
      company: CompanyModel.fromJson(json[ApiKeys.company]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.id: id,
      ApiKeys.name: name,
      ApiKeys.phone: phone,
      ApiKeys.email: email,
      ApiKeys.address: address,
      ApiKeys.username: username,
      ApiKeys.website: website,
      ApiKeys.company: company,
    };
  }
}
