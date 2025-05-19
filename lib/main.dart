import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/presentation/cubits/auth/login/login_cubit.dart';
import 'package:school_management_system/presentation/routes/app_routes.dart';
import 'package:school_management_system/presentation/routes/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => LoginCubit())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
 