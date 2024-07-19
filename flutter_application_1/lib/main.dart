import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int total = 0;

  void incrementNumber() {
    setState(() {
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  ShoppingItem(
                    title: "iPad Pro",
                    onIncrement: incrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad Air",
                    onIncrement: incrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad Mini",
                    onIncrement: incrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad",
                    onIncrement: incrementNumber,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 30),
                ),
                Text(
                  total.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ShoppingItem extends StatefulWidget {
  final String title;
  final VoidCallback onIncrement;

  ShoppingItem({required this.title, required this.onIncrement});

  @override
  State<ShoppingItem> createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontSize: 28),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  count--;
                });
              },
              icon: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              count.toString(),
              style: const TextStyle(fontSize: 28),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                });
                widget.onIncrement();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
