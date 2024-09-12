import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  UserTile({super.key, required this.text, required this.onTap});
  String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary),
        child: Row(
          children: [Icon(Icons.person), Text(text)],
        ),
      ),
    );
  }
}
