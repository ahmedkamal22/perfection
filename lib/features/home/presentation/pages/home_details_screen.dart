import 'package:flutter/material.dart';
import 'package:perfection/features/home/data/models/user_model.dart';
import 'package:perfection/features/home/presentation/widgets/home_details_widget.dart';

class HomeDetailsScreen extends StatelessWidget {
  final UserModel user;

  const HomeDetailsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          '${user.firstName} ${user.lastName}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: HomeDetailsWidget(user: user),
        ),
      ),
    );
  }
}
