import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfection/features/home/cubit/cubit.dart';
import 'package:perfection/features/home/cubit/states.dart';
import 'package:perfection/features/home/presentation/pages/home_details_screen.dart';
import 'package:perfection/features/home/presentation/widgets/shimmer_loading_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().fetchUsers();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isNearBottom) {
      // context.read<UsersCubit>().fetchUsers();
    }
  }

  bool get _isNearBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= maxScroll;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Users',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<UsersCubit, UsersStates>(
        builder: (context, state) {
          if (state is GetUsersLoadingState) {
            return ShimmerLoadingData(scrollController: _scrollController);
          }

          if (state is GetUsersFailureState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          }

          if (state is GetUsersSuccessState) {
            return ListView.separated(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: state.users.length,
              separatorBuilder: (context, index) => const SizedBox(height: 25),
              itemBuilder: (context, index) {
                if (index == state.users.length) {
                  return state is GetUsersLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : const SizedBox();
                }

                final user = state.users[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailsScreen(user: user),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Hero(
                        tag: user.avatar,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                          radius: 35,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${user.firstName} ${user.lastName}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              user.email,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
