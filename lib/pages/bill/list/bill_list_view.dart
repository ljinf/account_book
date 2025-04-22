import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BillListPage extends StatefulWidget {
  const BillListPage({super.key});

  @override
  State<BillListPage> createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text('bill list'),
      ),
    );
  }
}
