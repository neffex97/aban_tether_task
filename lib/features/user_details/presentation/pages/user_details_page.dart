import 'package:aban_tether_task/features/user_details/presentation/bloc/user_details_cubit.dart'
    show UserDetailsCubit;
import 'package:aban_tether_task/features/user_details/presentation/bloc/user_details_state.dart'
    show
        UserDetailsError,
        UserDetailsLoaded,
        UserDetailsLoading,
        UserDetailsState,
        UserDetailsSuccess;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

  UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserDetailsCubit, UserDetailsState>(
              builder: (context, state) {
                if (state is UserDetailsLoading) {
                  return const CircularProgressIndicator();
                } else if (state is UserDetailsLoaded) {
                  return Column(
                    children: [
                      Text('Name: ${state.user.name}'),
                      Text('Email: ${state.user.email}'),
                    ],
                  );
                } else if (state is UserDetailsError) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                } else if (state is UserDetailsSuccess) {
                  return Column(
                    children: [
                      Text('Name: ${state.user.name}'),
                      Text('Email: ${state.user.email}'),
                      Text('Phone: ${state.user.phoneNumber}'),

                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Enter Phone Number',
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final phone = _phoneController.text;
                context.read<UserDetailsCubit>().validateAndSubmitPhoneNumber(
                  phone,
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
