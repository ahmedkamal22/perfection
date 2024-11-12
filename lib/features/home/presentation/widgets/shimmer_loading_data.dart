import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingData extends StatelessWidget {
  const ShimmerLoadingData({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 30,
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
