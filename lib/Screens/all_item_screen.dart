import 'package:favourite_item_with_provider/Providers/favourite_item_providers.dart';
import 'package:favourite_item_with_provider/Screens/my_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteItemExample extends StatefulWidget {
  const FavouriteItemExample({super.key});

  @override
  State<FavouriteItemExample> createState() => _FavouriteItemExampleState();
}

class _FavouriteItemExampleState extends State<FavouriteItemExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Item Example",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyFavouriteItem(),),);
            },
            child: const Icon(Icons.favorite_outlined),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return Consumer<FavoriteItemProviderClass>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedList.contains(index)) {
                          value.removeSelectedItem(index);
                        } else {
                          value.addSelectedItem(index);
                        }
                      },
                      title: Text(
                        "Item No. :  $index",
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      trailing: value.selectedList.contains(index)
                          ? const Icon(
                              Icons.favorite_outlined,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
