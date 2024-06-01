import 'package:clean_architecture/core/connection/network_info.dart';
import 'package:clean_architecture/core/database/api/dio_consumer.dart';
import 'package:clean_architecture/core/database/cache/cache_helper.dart';
import 'package:clean_architecture/core/params/params.dart';
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture/features/user/domain/usecases/get_user.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_state.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final userOrFailure = await GetUser(
      repository: UserRepositoryImpl(
        networkInfo: NetworkInfoImpl(DataConnectionChecker()),
        userRemoteDataSource:
            UserRemoteDataSource(apiConsumer: DioConsumer(dio: Dio())),
        userLocalDataSource: UserLocalDataSource(cacheHelper: CacheHelper()),
      ),
    ).call(
      params: UserParams(id: id.toString()),
    );

    userOrFailure.fold(
      (failure) => emit(GetUserFailure(errMessage: failure.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
