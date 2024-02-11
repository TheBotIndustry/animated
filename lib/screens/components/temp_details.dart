import 'package:animated_tesla_car/constanins.dart';
import 'package:animated_tesla_car/home_controller.dart';
import 'package:animated_tesla_car/screens/components/temp_btn.dart';
import 'package:flutter/material.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required HomeController controller,
  }) : _controller = controller;

  final HomeController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: [
                TempBtn(
                  isActive: _controller.isCoolSelected,
                  svgSrc: 'assets/icons/coolShape.svg',
                  title: 'Cool',
                  press: _controller.updateCoolSelected,
                  activeColor: primaryColor,
                ),
                const SizedBox(width: defaultPadding),
                TempBtn(
                  isActive: !_controller.isCoolSelected,
                  svgSrc: 'assets/icons/heatShape.svg',
                  title: 'Heat',
                  press: _controller.updateCoolSelected,
                  activeColor: redColor,
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_up,
                  size: 48,
                ),
              ),
              const Text(
                "29" "\u2103",
                style: TextStyle(fontSize: 86),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  size: 48,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text('CURRENT TEMTERATURE'),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Inside'.toUpperCase(),
                  ),
                  const Text(
                    "20" "\u2103",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outside'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                  const Text(
                    "35" "\u2103",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
