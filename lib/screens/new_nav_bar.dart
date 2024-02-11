import 'package:animated_tesla_car/models/nav_item_model.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const Color bottomNavBgColor = Color(0xFF17203A);

class NewNavBarScreen extends StatefulWidget {
  const NewNavBarScreen({super.key});

  @override
  State<NewNavBarScreen> createState() => _NewNavBarScreenState();
}

class _NewNavBarScreenState extends State<NewNavBarScreen> {
  List<SMIBool> riveIconInputs = [];
  List<StateMachineController?> controllers = [];

  int selectedNavIndex = 0;

  List<String> textPages = [
    'Chat',
    'Search',
    'Timer',
    'Settings',
    'Audio',
  ];

  void animateTheIcon(int index) {
    riveIconInputs[index].change(true);
    Future.delayed(
      const Duration(seconds: 1),
      () {
        riveIconInputs[index].change(false);
      },
    );
  }

  void riveOnInIt(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);

    artboard.addController(controller!);
    controllers.add(controller);

    riveIconInputs.add(controller.findInput<bool>('active') as SMIBool);
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          textPages[selectedNavIndex],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 55,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: bottomNavBgColor.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: bottomNavBgColor.withOpacity(0.3),
                offset: const Offset(0, 20),
                blurRadius: 20,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              bottomNavItems.length,
              (index) {
                final riveIcon = bottomNavItems[index].rive;
                return GestureDetector(
                  onTap: () {
                    animateTheIcon(index);
                    setState(() {
                      selectedNavIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBar(isActive: index == selectedNavIndex),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: selectedNavIndex == index ? 1 : 0.5,
                          child: RiveAnimation.asset(
                            riveIcon.src,
                            artboard: riveIcon.artboard,
                            onInit: (artboard) {
                              riveOnInIt(artboard,
                                  stateMachineName: riveIcon.stateMachineName);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: const BoxDecoration(
        color: Color(0xFF81B4FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
