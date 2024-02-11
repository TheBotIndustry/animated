import 'package:animated_tesla_car/constanins.dart';
import 'package:flutter/material.dart';

class BatteryStatus extends StatelessWidget {
  const BatteryStatus({
    super.key,
    required this.constrains,
  });

  final BoxConstraints constrains;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          '220 mi',
          style: TextStyle(fontSize: 28),
        ),
        const Text(
          '62%',
          style: TextStyle(fontSize: 24),
        ),
        const Spacer(),
        Text(
          'Charging'.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
        const Text(
          '18 min remaining',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: constrains.maxHeight * 0.12),
        const DefaultTextStyle(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('22 mi/hr'),
              Text('232 v'),
            ],
          ),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
