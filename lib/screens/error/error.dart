import 'package:agricrops/constants/color_constant.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String title;
  final String message;
  final Widget action;

  const ErrorScreen({
    Key? key,
    required this.title,
    required this.message,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Icon(
                  Icons.error_outline_outlined,
                  size: 32,
                  color: kRed,
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: kRed),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: action,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
