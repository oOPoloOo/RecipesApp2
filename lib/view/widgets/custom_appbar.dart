import 'package:flutter/material.dart';

var backColor = Colors.amber[400]; // panaikint!

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String screen;
  //final Product? product;
  const CustomAppBar({
    Key? key,
    required this.screen,
    // this.product,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return (screen == '/') ? HomeAppBar() : ExitNavBar();
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Cook Book',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Colors.black,
            ),
      ),
      backgroundColor: backColor,
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          icon: const Icon(
            Icons.add,
            size: 35,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
            alignment: Alignment.center,
            height: 35,
            width: 35,
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
  const ExitNavBar({Key? key}) : super(key: key);

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
            height: 35,
            width: 35,
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
