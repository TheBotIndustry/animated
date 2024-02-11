import 'package:animated_tesla_car/models/rive_model.dart';

class NavItemModel {
  final String title;
  final RiveModel rive;

  NavItemModel({
    required this.title,
    required this.rive,
  });
}

List<NavItemModel> bottomNavItems = [
  NavItemModel(
    title: 'Chat',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'CHAT',
      stateMachineName: 'CHAT_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Search',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'SEARCH',
      stateMachineName: 'SEARCH_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Timer',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'TIMER',
      stateMachineName: 'TIMER_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Settings',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'SETTINGS',
      stateMachineName: 'SETTINGS_Interactivity',
    ),
  ),
  NavItemModel(
    title: 'Audio',
    rive: RiveModel(
      src: 'assets/rive/icons.riv',
      artboard: 'AUDIO',
      stateMachineName: 'AUDIO_Interactivity',
    ),
  ),
];
