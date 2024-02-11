import 'package:animated_tesla_car/constanins.dart';
import 'package:animated_tesla_car/models/tyre_psi.dart';
import 'package:flutter/material.dart';

class TyrePsiCard extends StatelessWidget {
  const TyrePsiCard({
    super.key,
    required this.isBottomTwoTyre,
    required this.tyrePsi,
  });

  final bool isBottomTwoTyre;
  final TyrePsi tyrePsi;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color:
            tyrePsi.isLowPressure ? redColor.withOpacity(0.1) : Colors.white10,
        border: Border.all(
          color: tyrePsi.isLowPressure ? redColor : primaryColor,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: isBottomTwoTyre
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tyrePsi.isLowPressure) lowPressureText(),
                const Spacer(),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: defaultPadding),
                psiText(psi: tyrePsi.psi.toString()),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                psiText(psi: tyrePsi.psi.toString()),
                const SizedBox(height: defaultPadding),
                Text(
                  '${tyrePsi.temp}\u2103',
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                if (tyrePsi.isLowPressure) lowPressureText(),
              ],
            ),
    );
  }

  Column lowPressureText() {
    return Column(
      children: [
        Text(
          'Low'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 48,
          ),
        ),
        Text(
          'Pressure'.toUpperCase(),
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }

  Text psiText({required String psi}) {
    return Text.rich(
      TextSpan(
        text: psi,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        children: const [
          TextSpan(
            text: 'psi',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
