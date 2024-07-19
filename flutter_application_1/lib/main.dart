import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  void incrementNumber(int count, int price) {
    setState(() {
      total += price;
    });
  }

  void decrementNumber(int count, int price) {
    setState(() {
      total -= price;
    });
  }

  void clearCart() {
    setState(() {
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Shopping Cart"),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  ShoppingItem(
                    title: "iPad",
                    price: 19000,
                    onIncrement: incrementNumber,
                    onDecrement: decrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad mini",
                    price: 23000,
                    onIncrement: incrementNumber,
                    onDecrement: decrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad Air",
                    price: 29000,
                    onIncrement: incrementNumber,
                    onDecrement: decrementNumber,
                  ),
                  ShoppingItem(
                    title: "iPad Pro",
                    price: 39000,
                    onIncrement: incrementNumber,
                    onDecrement: decrementNumber,
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
                  NumberFormat('#,###').format(total),
                  style: const TextStyle(fontSize: 30),
                ),
                const Text(
                  "Baht",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: clearCart,
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepOrange),
                  child: const Text("Clear"),
                ),
              ),
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
  final int price;
  final Function(int count, int price) onIncrement;
  final Function(int count, int price) onDecrement;

  ShoppingItem(
      {required this.title,
      required this.price,
      required this.onIncrement,
      required this.onDecrement});

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontSize: 28),
              ),
              Text("${NumberFormat('#,###').format(widget.price)}฿"),
            ],
          ),
        ),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  if (count > 0) {
                    setState(() {
                      count--;
                    });
                    widget.onDecrement(count, widget.price);
                  }
                },
                icon: const Icon(Icons.remove)),
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
                  widget.onIncrement(count, widget.price);
                },
                icon: const Icon(Icons.add)),
          ],
        )
      ],
    );
  }
}
