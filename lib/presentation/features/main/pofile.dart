import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kino_rant/presentation/features/auth/bloc/auth_cubit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    debugPrint(user.displayName.toString() + user.uid.toString());
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(48),
              side: BorderSide.none,
            ),
            color: Color(0xff1E1E1E),
            child: SizedBox(
              height: 110,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        height: 70,
                        width: 70,
                        'https://api.dicebear.com/9.x/glass/png?seed=${user.displayName.toString() + user.uid.toString()}',
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      FirebaseAuth.instance.currentUser!.displayName
                          .toString()
                          .toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.go('/login');
            },
            child: Text('Выйти', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
