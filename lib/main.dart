import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/core/api/api_service.dart';
import 'package:perfection/core/utils/bloc_observer.dart';
import 'package:perfection/core/utils/themes.dart';
import 'package:perfection/features/home/cubit/cubit.dart';
import 'package:perfection/features/home/data/repositories/user_repository.dart';
import 'package:perfection/features/splash/presentation/pages/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  changeStatusBarIconColors();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(UserRepository(ApiService())),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
