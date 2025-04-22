import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountBookPage extends StatefulWidget {
  const AccountBookPage({super.key});

  @override
  State<AccountBookPage> createState() => _AccountBookPageState();
}

class _AccountBookPageState extends State<AccountBookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('account book'),
      ),
    );
  }
}
