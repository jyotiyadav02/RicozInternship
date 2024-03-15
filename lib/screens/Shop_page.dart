import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> _cartItems = []; // List to store cart items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: _cartItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_cartItems[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _cartItems.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemToCart(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItemToCart(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String newItem = ''; // Variable to store the new cart item

        return AlertDialog(
          title: const Text('Add to Cart'),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newItem.isNotEmpty) {
                  Navigator.pop(context, newItem); // Return the new item
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _cartItems.add(result); // Add the new item to the cart
      });
    }
  }
}
