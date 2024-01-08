import 'package:flutter/material.dart';
import 'package:tdm_user_app/view/widgets/h_text.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HeadingText(text: "WalletTab"),
      ),
    );
  }
}