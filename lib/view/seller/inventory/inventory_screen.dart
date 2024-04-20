import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {},
          backgroundColor: amber,
          child: Icon(
            Icons.add,
            color: black,
          ),
        ),
        appBar: PreferredSize(
            preferredSize: Size(width, height * 0.1),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.02, vertical: height * 0.01),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: appBarGradientColor,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Row(
                children: [
                  Image(
                    image:
                        const AssetImage("assets/images/amazon_black_logo.png"),
                    height: height * 0.06,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: black,
                      size: height * 0.04,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: black,
                      size: height * 0.04,
                    ),
                    color: black,
                  )
                ],
              ),
            )),
        body: Center(
          child: Text('Inventory'),
        ),
      ),
    );
  }
}
