import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/errors/expentions.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entities/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.networkInfo,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> getUserData(
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDataSource.getUserData(params);
        userLocalDataSource.cacheUserData(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getCachedUserData();

        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.toString()));
      }
    }
  }
}
