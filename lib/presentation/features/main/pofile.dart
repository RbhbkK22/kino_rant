import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/features/auth/bloc/auth_cubit.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            FirebaseAuth.instance.currentUser!.displayName.toString(),
            style: TextStyle(color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.go('/login');
            },
            child: Text('выйти'),
          ),
        ],
      ),
    );
  }
}
