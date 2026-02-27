import 'package:flutter/cupertino.dart';

class MainContainer extends StatelessWidget {
  final Widget child;

  const MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: 20), child: child);
  }
}
