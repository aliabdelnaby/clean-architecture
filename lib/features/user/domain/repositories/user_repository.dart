import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/user/domain/entities/user_entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserData();
}
