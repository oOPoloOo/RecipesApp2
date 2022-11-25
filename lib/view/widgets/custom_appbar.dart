import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screen;
  final double iconsSize;

  const CustomAppBar({
    Key? key,
    required this.screen,
    this.iconsSize = 35,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return (screen == '/')
        ? HomeAppBar(
            iconsSize: iconsSize,
          )
        : ExitNavBar(
            iconsSize: iconsSize,
          );
  }
}

class HomeAppBar extends StatelessWidget {
  final double iconsSize;

  const HomeAppBar({
    Key? key,
    required this.iconsSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Cook Book',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
            ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          icon: Icon(
            Icons.add,
            size: iconsSize,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
            alignment: Alignment.center,
            height: iconsSize,
            width: iconsSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.person, color: Colors.black, size: 22),
          ),
        ),
      ],
    );
  }
}

class ExitNavBar extends StatelessWidget {
  final double iconsSize;

  const ExitNavBar({
    Key? key,
    required this.iconsSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Container(
            alignment: Alignment.center,
            height: iconsSize,
            width: iconsSize,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.close, color: Colors.black, size: 22),
          ),
        ),
      ],
    );
  }
}
