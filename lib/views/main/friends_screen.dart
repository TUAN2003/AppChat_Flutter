import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(5),
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.deepOrange,
            backgroundImage: NetworkImage(
                'https://djm-aaa1.kxcdn.com/resources/upload/products/71aYXax4t5L._AC_SL1313_.jpg'),
          ),
          title: Text('vu anh tuan'),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        thickness: 0.5,
        indent: 10,
      ),
    );
  }
}
