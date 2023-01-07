import 'package:favourite_item_with_provider/Providers/favourite_item_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFavouriteItem extends StatefulWidget {
  const MyFavouriteItem({super.key});

  @override
  State<MyFavouriteItem> createState() => _MyFavouriteItemState();
}

class _MyFavouriteItemState extends State<MyFavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favourite Item",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<FavoriteItemProviderClass>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: value.selectedList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Item No. :  ${value.selectedList[index]}",
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.favorite_outlined,
                        color: Colors.red,
                      ),
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
