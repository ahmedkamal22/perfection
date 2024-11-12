import 'package:flutter/material.dart';
import 'package:perfection/features/home/data/models/user_model.dart';

class HomeDetailsWidget extends StatelessWidget {
  const HomeDetailsWidget({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: user.avatar,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              radius: 100,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          user.email,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
