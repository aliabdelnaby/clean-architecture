import 'package:clean_architecture/core/database/api/end_points.dart';
import 'package:clean_architecture/features/user/domain/entities/sub_entities/geo_entity.dart';

class GeoModel extends GeoEntity {
  GeoModel({
    required super.lat,
    required super.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json[ApiKeys.lat],
      lng: json[ApiKeys.lng],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ApiKeys.lat: lat,
      ApiKeys.lng: lng,
    };
  }
}
