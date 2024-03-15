import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<String> _wishlistItems = [
    'Product A',
    'Product B',
    'Product C',
    'Product D',
  ]; // List to store wishlist items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
      ),
      body: _wishlistItems.isEmpty
          ? Center(
              child: Text(
                'Your wishlist is empty.',
                style: TextStyle(fontSize: 18.0),
              ),
            )
          : ListView.builder(
              itemCount: _wishlistItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      title: Text(
                        _wishlistItems[index],
                        style: TextStyle(fontSize: 16.0),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            _wishlistItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItemToWishlist(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addItemToWishlist(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String newItem = ''; // Variable to store the new wishlist item

        return AlertDialog(
          title: const Text('Add to Wishlist'),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
            decoration: const InputDecoration(
              hintText: 'Enter item',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
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
        _wishlistItems.add(result); // Add the new item to the wishlist
      });
    }
  }
}
