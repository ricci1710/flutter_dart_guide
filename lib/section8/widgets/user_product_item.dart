import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String titel;
  final String imageUrl;

  const UserProductItem(this.titel, this.imageUrl, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titel),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).colorScheme.primary,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                )),
          ],
        ),
      ),
    );
  }
}
