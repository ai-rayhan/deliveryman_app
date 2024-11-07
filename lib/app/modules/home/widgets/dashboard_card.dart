import 'package:flutter/material.dart';

class OrderCountCard extends StatelessWidget {
  final Color color;
  final String title;
  final String value;

  const OrderCountCard({
    super.key,
    required this.color,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.swap_vert_sharp, color: Colors.white, size: 30),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
