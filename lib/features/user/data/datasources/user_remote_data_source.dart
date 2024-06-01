import 'package:clean_architecture/core/database/api/api_consumer.dart';
import 'package:clean_architecture/core/database/api/end_points.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer apiConsumer;
  UserRemoteDataSource(this.apiConsumer);
  Future<UserModel> getUserData(UserParams params) async {
    final response = await apiConsumer.get(
      "${EndPoints.user}/${params.id}",
    );
    return UserModel.fromJson(response);
  }
}
