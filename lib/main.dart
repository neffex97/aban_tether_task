import 'package:aban_tether_task/features/user_details/injection_container.dart'
    show init, sl;
import 'package:aban_tether_task/features/user_details/presentation/bloc/user_details_cubit.dart'
    show UserDetailsCubit;
import 'package:aban_tether_task/features/user_details/presentation/pages/user_details_page.dart'
    show UserDetailsPage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init(); // Initialize dependencies
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => sl<UserDetailsCubit>(),
        child: UserDetailsPage(),
      ),
    );
  }
}
