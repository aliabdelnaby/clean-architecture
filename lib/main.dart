import 'package:clean_architecture/core/database/cache/cache_helper.dart';
import 'package:clean_architecture/features/user/presentation/cubit/user_cubit.dart';
import 'package:clean_architecture/features/user/presentation/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => UserCubit()..eitherFailureOrUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
